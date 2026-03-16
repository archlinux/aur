Release notes
==============

This package release accompanies code changes that update the UI behavior:

- Keep the network-specific menu open while Connect/Disconnect/Forget operations run, instead of immediately returning to the main menu.
- Remove the busy/spinner indicator from the network list UI; the controller still tracks operation state internally.

Files changed (upstream):

- internal/app/controller.go
- internal/ui/format.go
- internal/ui/helpers.go

Artifacts:

- The built binary `nmsurf` and archive `nmsurf-linux-amd64.tar.gz` are available in the repository root (not packaged in this commit).

Notes:

- This release file is informational for packaging; update PKGBUILD/.SRCINFO as needed to reflect versioning and checksums.
