# Security

Use diagnostics only on systems and networks you are authorized to examine.
The initial image inherits official baseline live-console privileges and must
be used only in an isolated VM. Do not expose it as a remotely accessible host.
Non-root desktop sessions, explicit administrative authorization, firewall policy
and log redaction are release gates before the desktop milestone is accepted.

Do not publish secrets or sensitive captures in issues. A private reporting
contact has not yet been configured; agree on a private channel with the owner
before sharing sensitive evidence.
No scripts install to physical disks or alter the host bootloader.
