#!/usr/bin/env bash
set -euo pipefail
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
[[ $(uname -s) == Linux && $(uname -m) == x86_64 && -f /etc/arch-release ]] || {
    printf '%s\n' 'Build requires Arch Linux x86_64.' >&2; exit 1;
}
for tool in mkarchiso pacman python; do
    command -v "$tool" >/dev/null || { printf 'Missing: %s\n' "$tool" >&2; exit 1; }
done
baseline=/usr/share/archiso/configs/baseline
[[ -f "$baseline/profiledef.sh" ]] || { printf '%s\n' 'Official baseline missing.' >&2; exit 1; }
mkdir -p "$root/work" "$root/outputs"
# A fresh directory avoids stale mkarchiso state without removing any user data.
job=$(mktemp -d "$root/work/build.XXXXXXXX")
profile="$job/profile"
cp -a -- "$baseline" "$profile"
cp -a -- "$root/iso/profile/airootfs/." "$profile/airootfs/"
printf '\n' >> "$profile/profiledef.sh"
cat "$root/iso/profile/profiledef.append.sh" >> "$profile/profiledef.sh"
iso="$root/outputs/danik-os-0.1.0-x86_64.iso"
[[ ! -e "$iso" && ! -e "$iso.sha256" ]] || {
    printf '%s\n' 'Output already exists; archive it before building again.' >&2; exit 1;
}
{
    pacman -Q archiso
    date -u +'%Y-%m-%dT%H:%M:%SZ'
    uname -m
} > "$job/build-environment.txt"
printf 'Build state retained in %s\n' "$job"
mkarchiso -v -w "$job/mkarchiso" -o "$root/outputs" "$profile"
[[ -s "$iso" ]] || { printf '%s\n' 'Expected ISO missing.' >&2; exit 1; }
(cd "$root/outputs" && sha256sum "$(basename -- "$iso")" > "$(basename -- "$iso").sha256")
