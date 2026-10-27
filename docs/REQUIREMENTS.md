# Requirements and acceptance

Foundation: official Archiso profile preparation, documented dependencies,
portable checks, structural ISO verification and recorded VM boot acceptance.
Boot acceptance remains pending until performed on Arch Linux.

Network: interfaces, addresses, routes, DNS, authorized discovery, connections,
packet capture and report exports. RF: actual Crazyradio USB detection and access
checks; supported Crazyflie connection, telemetry, session statistics and logs.
IoT: compatible ESP32/Arduino detection, explicit flashing and serial access.
Developer: language/tool profiles and optional containers/databases.

RF acceptance IDs: RF-01 hotplug, RF-02 unprivileged access, RF-03 identifiers,
RF-04 compatible link test, RF-05 actual telemetry, RF-06 available link statistics,
RF-07 events/errors, RF-08 JSON/CSV, RF-09 disconnect recovery, RF-10 installed
local functions offline. All RF checks currently skipped: implementation and
hardware are absent.

Release gates include ordinary desktop user, firewall, minimal enabled services,
secret-free logs, offline operation and failure recovery. No unattended installer
or host bootloader changes. Original dark/cyan UI assets only.
