# DANIK OS

## Project objective
Develop DANIK OS, a custom Arch Linux distribution for network diagnostics,
radio experiments, IoT, robotics, and software development. Use an original
futuristic network-control visual identity inspired by ctOS; never copy game assets.

## Technology stack and modules
Arch Linux x86_64, official Archiso, KDE Plasma, Qt Quick/QML, Python 3,
PySide6, Bitcraze cflib, Git and automated testing.
Modules: Network (authorized diagnostics and packet analysis), RF (Crazyradio,
supported Crazyflie telemetry and exports), IoT (ESP32, Arduino and serial),
Developer (languages, compilers, Git, tests and optional containers).

## Architecture
- Separate UI from services; never block the GUI thread with long operations.
- Keep modules independently testable and handle missing/disconnected hardware.
- Never fabricate device status, measurements or telemetry.
- Use least privilege, reproducible configuration and documented dependencies.

## Build and safety
- Use official Archiso; never mix Debian, Ubuntu or Kali repositories into pacman.
- Do not run destructive disk commands, overwrite user data, modify the host
  bootloader or perform unattended physical installation.
- Never claim builds or hardware tests passed without running them.
- Clearly distinguish passed, failed and skipped checks; protect secrets.
- Never modify production databases without explicit approval.

## Workflow
Before edits inspect the repository/environment and existing documentation.
Propose a small testable plan, implement one milestone, run available checks,
and document unresolved issues and required hardware.
Start with a minimal bootable Archiso image; do not implement all modules at once.
Handle simple work directly; medium work directly or with one agent; complex work
with at most two agents. Critical changes require review and verification.
Use explorer/coder/reviewer/tester roles as appropriate. Never overlap file edits,
preserve others' changes, reuse findings, inspect relevant files only, and stop
after two failed attempts at the same approach. Report changes, files, actual
test results and remaining risks.
