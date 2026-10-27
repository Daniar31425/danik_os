# Build and verification

Build on Arch Linux x86_64 with official `archiso`. Windows is suitable for editing
and portable checks; a native Windows ISO build is not supported here.
Use the README commands in an Arch VM or dedicated build host. Current Archiso
supports an ordinary user through Linux user namespaces; configure that support
on the build host instead of elevating the entire desktop application.

The build copies `/usr/share/archiso/configs/baseline` into a fresh `work/build.*`
directory, overlays tracked files and appends DANIK metadata. This preserves the
official boot configuration, hooks and package list across Archiso changes.
The tracked directory is an overlay, not a standalone mkarchiso profile.
The resulting prepared directory can be inspected before repeating a build.
No build directory is deleted automatically and existing output is refused.

Each job retains the Archiso version and build timestamp in build-environment.txt.
Archive that file, the prepared profile and installed package manifests from the
build state with release artifacts. Live repositories are rolling: this is a
repeatable process, not a byte-identical or fully pinned build. Package snapshots,
toolchain pinning and provenance are pending release work.

`verify-iso.sh` checks a locally generated checksum and El Torito metadata. That
checksum detects accidental modification, not authenticity. Boot manually with
`run-vm.sh` and record: boot mode, console prompt, hostname, network interface,
clean shutdown and host isolation. Test BIOS and UEFI separately (`run_archiso -u
-i image.iso` for UEFI). A structural check does not prove a boot test passed.
Network-enabled QEMU defaults are inherited; use an isolated test environment.

Sources: [official Archiso](https://github.com/archlinux/archiso),
[profile format](https://github.com/archlinux/archiso/blob/master/docs/README.profile.rst),
[ArchWiki](https://wiki.archlinux.org/title/Archiso).
