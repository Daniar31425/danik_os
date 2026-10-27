#!/usr/bin/env bash
set -euo pipefail
[[ $# == 1 && -f $1 && -s $1 ]] || { printf 'Usage: bash %s image.iso\n' "$0" >&2; exit 1; }
command -v xorriso >/dev/null || { printf '%s\n' 'xorriso is required.' >&2; exit 1; }
iso=$(realpath -- "$1")
[[ -f "$iso.sha256" ]] || { printf '%s\n' 'Checksum sidecar missing.' >&2; exit 1; }
(cd "$(dirname -- "$iso")" && sha256sum -c "$(basename -- "$iso").sha256")
report=$(xorriso -indev "$iso" -report_el_torito plain 2>&1)
printf '%s\n' "$report"
[[ "$report" == *'El Torito boot img'* ]] || { printf '%s\n' 'No El Torito boot image found.' >&2; exit 1; }
printf '%s\n' 'PASS: checksum and boot metadata. Bootability still requires VM testing.'
