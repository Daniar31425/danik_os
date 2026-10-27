#!/usr/bin/env bash
set -euo pipefail
[[ $# == 1 && -s $1 ]] || { printf 'Usage: bash %s image.iso\n' "$0" >&2; exit 1; }
command -v run_archiso >/dev/null || { printf '%s\n' 'Install archiso and QEMU.' >&2; exit 1; }
# No host block devices, shared folders, or persistent virtual disks are attached.
exec run_archiso -i "$(realpath -- "$1")"
