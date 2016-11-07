# tmix

This is simply a packaged implementation of the script on the Arch wiki [tmux
page][src].

It provides a systemd user service which runs a tmux base session, and a shell
script for allowing parallel access to the base session.

Enable the systemd unit with `systemd --user enable tmux`. It does not seem to
automatically run the service on login over SSH, so it may be useful to add
`systemctl --user start tmux` to your shell login file. This is a no-op if the
service is already running, so multiple login shells will not cause an issue.

Attach to the base session with `tmix [$(whoami) [SESSION_NAME [WINDOW_NAME]]]`.

When called with no arguments, tmix connects to the session named after the user
and makes a new clone session named with the timestamp. tmix can also connect to
other base sessions, and will take either a given name or fall back to the
timestamp for the cloned session. If a third argument is given, a new window is
spawned with that name.

I'm not entirely sure how to get my pubkey someplace `gpg --recv-keys` can get
it. My key is available at [keybase.io/myrrlyn] or [myrrlyn.net/myrrlyn.asc].

[src]: https://wiki.archlinux.org/index.php/Tmux#Clients_simultaneously_interacting_with_various_windows_of_a_session
[keybase.io/myrrlyn]: https://keybase.io/myrrlyn
[myrrlyn.net/myrrlyn.asc]: https://myrrlyn.net/myrrlyn.asc
