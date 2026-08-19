# gftp-smb-git

*[Русская версия](README.ru.md)*

gFTP built from upstream git with four downstream patches:

- **`gftp-cifs.patch`** — a read-write SMB/CIFS backend built on [libsmb2](https://github.com/sahlberg/libsmb2).
- **`gftp-ru-translation.patch`** — restores the Russian translation, which lost ~101 strings when the PO
  catalogs were regenerated upstream, and adds Russian entries to the desktop file.
- **`gftp-wayland-icon.patch`** — makes the window report itself as `gftp` rather than `gftp-gtk`, so
  Wayland shells can match it to `gftp.desktop` and show its icon. Without it the window and its
  taskbar entry are iconless under compositors such as labwc with sfwbar.
- **`gftp-smb-ru.patch`** — Russian translations for the SMB backend's own strings. Applied last,
  because those msgids only exist once `gftp-cifs.patch` is in and `po/ru.po` has been rewritten by
  `gftp-ru-translation.patch`.

It conflicts with both `gftp` and `gftp-git` because it installs the same files.

## Requirements

The SMB backend needs `libsmb2`, currently available only as the AUR package `libsmb2-git`:

```
git clone https://aur.archlinux.org/libsmb2-git.git && cd libsmb2-git && makepkg -si
```

Then build this package normally with `makepkg -si`.

## Using the SMB backend

Connect with `smb://`, **not** `smb2://` — libsmb2's own header comments say `smb2://`, but its
URL parser rejects that spelling.

```
smb://server/share/path      a specific share
smb://server/                lists the server's shares
```

`gftp-text` works the same way:

```
gftp-text smb://server/share/
```

### Credentials

Enter a real username and password. **Anonymous and guest sessions cannot connect to a server that
requires SMB signing** — such sessions derive no NTLM session key, so there is nothing to sign with,
and the connection is refused. Most Windows servers are configured this way; Samba usually is not.

For an account in a domain other than the server's own, put the domain in the username separated by
a **semicolon**:

```
CORP;ivanov
```

If a connection fails, gFTP prints this hint next to the error. The underlying libsmb2 message is
frequently useless in that situation — it closes its context before reporting the failure, so the
real cause gets overwritten by `Read from socket failed, errno:9. Closing socket.` Do not chase
that errno; it is an artifact.

### Options

Three settings are registered under the SMB protocol:

| Option | Default | Effect |
|---|---|---|
| Require SMB signing | off | Force signing even when the server does not ask for it. Signing is negotiated automatically when the server *requires* it, so this is a hardening switch, not a fix for connection failures. |
| Require SMB3 encryption | off | Refuse to proceed without SMB3 transport encryption. |
| SMB operation timeout | 0 (disabled) | Abort SMB operations after this many seconds. |

## Known limitations

- **No DFS.** libsmb2 does not implement DFS referrals, so DFS namespace paths will not resolve.
- **No SMB1.** libsmb2 speaks SMB2 and SMB3 only. This is deliberate; SMB1 is obsolete and insecure.
- **File timestamps are not preserved on upload** — `set_file_time` is not implemented.
- **Stop cannot cleanly abort an in-flight operation.** libsmb2's synchronous calls are not
  interruptible by a signal; use the operation timeout instead.
- **Printer shares are listed as ordinary directories.** Share enumeration uses SHARE_INFO_1, which
  carries no share type.
- **No directory caching** — every listing goes to the network.

## Upstream

Both patches are intended for upstream. The Russian translation is
[issue #202](https://github.com/masneyb/gftp/issues/202). Report problems with the *packaging* here;
report problems with gFTP itself to <https://github.com/masneyb/gftp/issues>.
