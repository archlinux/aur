Remote command execution on Windows via SMB. This package builds the
`winexe` client from `samba/examples/winexe`, against the matching
upstream Samba release (i.e., I match the version in extra).

The binary is dynamically linked against the private libraries shipped
by Arch's `samba` package (`/usr/lib/samba/lib*-private-samba.so`), so
the dependency is pinned to the exact Samba version. When Samba is
upgraded, this package must be rebuilt.

### Local admin accounts on Win7/8/10/11

When authenticating as a *local* admin (non-domain), Windows applies
"Remote UAC" token filtering and hands the SMB session a standard-user
token, so `ADMIN$` and service installation fail. On the target:

    reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\system" \
      /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f

Takes effect immediately, no reboot needed. **Domain** admin accounts
are exempt from this filtering and do not need the tweak.

Reference: https://support.microsoft.com/kb/942817

### Windows XP, Server 2003, NT4

These only support SMB1 (NT1 dialect), and modern Samba rejects SMB1
   by default. Override with:

       --option='client min protocol = NT1'
       --option='client max protocol = NT1'

## Examples

For regular windows (11, 10, 2016, 8, 2012, 7, 2008, Vista): 

    winexe -U 'Administrator' //10.0.0.5 'cmd.exe /c hostname'

For legacy targets (XP, 2003, 2000, NT4):

    winexe \
      --option='client min protocol = NT1' \
      --option='client max protocol = NT1' \
      -U 'Administrator' \
      //10.0.0.5 'cmd.exe /c hostname'

The above examples will prompt for a password.
