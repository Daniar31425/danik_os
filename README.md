# DANIK OS 0.1.0 — foundation

Experimental Arch Linux x86_64 platform for network diagnostics, compatible
Bitcraze radio experiments, IoT and software development.

Current milestone: project documentation and a minimal official Archiso baseline
with DANIK branding. No release ISO has been built or boot-tested yet.
KDE Plasma, the control center and all four functional modules are planned.

## Quick start

On an Arch Linux x86_64 build machine:

```sh
sudo pacman -Syu --needed archiso python shellcheck qemu-desktop edk2-ovmf
python -m unittest discover -s tests -v
bash scripts/build-iso.sh
bash scripts/verify-iso.sh outputs/danik-os-0.1.0-x86_64.iso
bash scripts/run-vm.sh outputs/danik-os-0.1.0-x86_64.iso
```

Read [BUILD](docs/BUILD.md) before building. The build inherits the official
baseline's console login and boot defaults; it is for an isolated VM only.
It is not ready for everyday use or physical installation.

## Layout

- `iso/profile/`: tracked overlay applied to official Archiso baseline.
- `scripts/`: preparation/build, structural ISO verification and diskless VM boot.
- `docs/`: architecture, requirements, roadmap, build and hardware support.
- `tests/`: portable foundation checks.
- `packages/`, `apps/`, `configs/`: reserved locations; implementation follows
  milestone acceptance, rather than placeholder functional code.

See [AGENTS.md](AGENTS.md), [CONTRIBUTING](CONTRIBUTING.md), and
[SECURITY](SECURITY.md). Licensing of original project code remains undecided;
see LICENSE.
