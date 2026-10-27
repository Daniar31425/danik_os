# Architecture

Arch Linux and KDE Plasma provide the eventual desktop. The QML control center
will consume asynchronous Python services for system, network, USB, radio,
Crazyflie and event logging. Service failures must not terminate the shell.
Privileged actions require narrow authorization; no all-root GUI is permitted.

Module boundaries are Network, RF, IoT and Developer. Missing equipment is
unavailable, never simulated. Telemetry and topology must carry real provenance.
The first milestone contains only a baseline overlay and build tooling.
API transport, packaging and persistence are decisions for later milestones.
