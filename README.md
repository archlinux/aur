# Linux-Roaming-Profiles
A roaming profile implementation for Linux

# Abstract
This project targets to provide the tooling required to provide roaming user profiles similar to what Windows provides.

## Basic idea
* On user-login the user home directory (or parts of it) is synchronized from a remote server to the local disk.
* During user sessions the local profile provides quick access to files and is not prone to network interruptions.
* On termination of the last session the user profile is synchronized to a remote server.

## Advantages
Advantages over other technologies like NFS/SMB home mounts or similar technologies.
* Compared to mounted network shares this is providing better offline usability. Cache-FS and NFS/SMB cached operations might not be ideal for every use-case. Specifically when accessing less-frequently used files.
* Compared to fully local user profiles/home-directories it provides a way for automatic backup of user files and settings.
* Allow fully offline operation.

## Disadvantages
Disadvantages compared to other NFS/SMB home mounts or local home mounts.
* Logon/logoff delay: Large file sync might slow down logon/logoff processes.
* Risk of improper sync: Specifically when loging on offline or logging off while offline sync might be incomplete. Subsequent logon/logoff sequenences need to deal with such situations as well as possible.
* Multiple systems: When logging on to multiple systems at the same time conflicts might occur during synchronization to the master profile on server.
* Linux does not provide guidelines to application developers where to place "local-only" files and where to provide "roaming" profile date just as Windows does with "%AppData%" and "%LocalAppData%" folders. So it might be required to adjust a custom include/exclude list depending on applications used.

# Preconditions
Currently this project has been used on the following distributions:
* Manjaro Linux
* EndeavourOS
* Arch Linux

It is focussing on synchronizing user profiles from/to an SMB server (preferrably Samba but can also be any Windows Server) to allow integration into Windows environments where typically Roaming Profiles are used. Authentication is focussing on Kerberos with Winbind to allow automatic single-sign-on and user-space profile synchronization.
Development target is to work with graphical sesssions as well as SSH sessions.

# Features
* Systemd unit assuring profile data to be pulled on login and pushed on logout.
* Script to be used with pam_exec to force early profile push while Kerberos credentials are still cached.
* Global exclude list allowing to exclude files from sync by pattern.

# Pre-Requirements
Your system must be Active-Directory integrated. Currently a winbind-based ingegration has been tested. Refer to the [Arch Linux Active Directory Integration](https://wiki.archlinux.org/title/Active_Directory_integration) documentation.

Here are the most important steps assuming you are already running an Active Directory Server (Windows or Samba) assuming your Server is up and DNS configuration is ready...

NOTE: The Arch Linux Wiki describing to set up NTP. Do NOT do this on recent client builds. Rather make sure systemd NTP service is enabled (check `timedatectl` output). A synchronized clock is crucial for Kerberos to work.

## Kerberos configuration
Use the following Kerberos configuration as a template:

    /etc/krb5.conf

    [libdefaults]
    default_realm = AD.DOMAIN.TLD
    default_ccache_name = KEYRING:persistent:%{uid}
    dns_lookup_realm = false
    dns_lookup_kdc = false

    [realms]
    AD.DOMAIN.TLD = {
        kdc = server.ad.domain.tld
        default_domain = AD.DOMAIN.TLD
        admin_server = server.ad.domain.tld
    }
    DOMAIN = {
        kdc = server.ad.domain.tld
        default_domain = AD.DOMAIN.TLD
        admin_server = server.ad.domain.tld
    }

    [domain_realm]
        .ad.domain.told = AD.DOMAIN.TLD

    [appdefaults]
    pam = {
        ticket_lifetime = 7d
        renew_lifetime = 14d
        forwardable = true
        proxiable = false
        minimum_uid = 1
    }

A few notes:
* Ticket lifetime and renew lifetime will not be longer than set on your KDC. See `man smb.conf` if you use Samba.
* I am using the kernel keyring to store the ticket cache. You can also use file storage.

## Samba configuration

    /etc/samba/smb.conf

    [global]
        workgroup = DOMAIN
        security = ADS
        realm = AD.DOMAIN.TLD

        winbind refresh tickets = Yes
        vfs objects = acl_xattr
        map acl inherit = Yes
        store dos attributes = Yes

        # Allow a single, unified keytab to store obtained Kerberos tickets
        dedicated keytab file = /etc/krb5.keytab
        kerberos method = secrets and keytab

        # Do not require that login usernames include the default domain
        winbind use default domain = yes

        # UID/GID mapping for local users
        idmap config * : backend = tdb
        # This range must not overlap with any domain-spefific range.
        idmap config * : range = 300-799

        # UID/GID mapping for domain users
        idmap config DOMAIN : backend = ad
        idmap config DOMAIN : schema_mode = rfc2307
        idmap config DOMAIN : range = 10000-99999
        # Read account name, UID, login shell, home directory path and primary group from AD
        # idmap config DOMAIN : unix_nss_info = yes
        # Read account name, UID and primary group from AD only
        idmap config DOMAIN : unix_nss_info = no
        # Use primary group in USER gidNumber attribute and ignore gidNumber in primary "Domain Users" group.
        # idmap config DOMAIN : unix_primary_group = yes

        # Allow offline/cached credentials and ticket refresh
        winbind offline logon = yes
        winbind refresh tickets = yes
        winbind nss info = template
        template homedir = /home/%U
        template shell = /bin/bash
        winbind enum users = yes
        winbind enum groups = yes

Now join the client to domain:
    net ads join -U Administrator

Enable and run winbind service:
    systemctl enable winbind.service --now

Update `/etc/nsswitch.conf` and add winbind to passwd and group:
    passwd: files systemd winbind
    group: files [SUCCESS=merge] systemd [SUCCESS=merge] winbind

After successful join `wbinfo -u` should display the domain user list. As well as `id <domainuser>` shall display user configuration. If it does not try cleaning the cache and retry:
    net cache flush

## PAM authenticication
Configure pam_winbind in `/etc/security/pam_winbind.conf`:

    [Global]
        debug = no
        debug_state = yes
        try_first_pass = yes
        krb5_auth = yes
        krb5_ccache_type = KEYRING
        cached_login = yes
        silent = no
        mkhomedir = yes

Then modify the PAM configuration:

    /etc/pam.d/system-auth

    #%PAM-1.0

    auth       required                    pam_faillock.so      preauth
    # Optionally use requisite above if you do not want to prompt for the password
    # on locked accounts.
    -auth      [success=3 default=ignore]  pam_systemd_home.so
    auth       [success=2 default=ignore]  pam_winbind.so
    auth       [success=1 default=bad]     pam_unix.so          try_first_pass nullok
    auth       [default=die]               pam_faillock.so      authfail
    auth       optional                    pam_permit.so
    auth       required                    pam_env.so
    auth       required                    pam_faillock.so      authsucc
    # If you drop the above call to pam_faillock.so the lock will be done also
    # on non-consecutive authentication failures.

    -account   [success=2 default=ignore]  pam_systemd_home.so
    account    [success=1 default=ignore]  pam_winbind.so
    account    required                    pam_unix.so
    account    optional                    pam_permit.so
    account    required                    pam_time.so

    -password  [success=2 default=ignore]  pam_systemd_home.so
    password   [success=1 default=ignore]  pam_winbind.so
    password   required                    pam_unix.so          try_first_pass nullok shadow sha512
    password   optional                    pam_permit.so

    -session   optional                    pam_systemd_home.so
    session    required                    pam_mkhomedir.so skel=/etc/skel/ umask=0022
    session    required                    pam_limits.so
    session    required                    pam_winbind.so
    session    required                    pam_unix.so
    session    optional                    pam_permit.so

Make sure pam_winbind.so is added to auth, account, password and session.
Optionally you might want to add `pam_winbind.so` also to other services like `su` which do not use `system-auth`.

## SSHD
If you want to log on using SSH you need to make sure `UsePAM=yes` is configured in your SSH daemon configuration (`/etc/ssh/sshd_config`). This should be default on Arch Linux as configured in `/etc/ssh/sshd_config.d/99-archlinux.conf`.

## Validation
After successful Domain integration yous hould be able to log in with a domain `user`.
Right after login you shouild already have a valid kerberos ticket. Validate using the `klist` command:

    $ klist
    Ticket cache: KEYRING:persistent:10000:10000
    Default principal: user@AD.DOMAIN.TLD

    Valid starting       Expires              Service principal
    19.11.2024 17:40:20  20.11.2024 03:40:19  cifs/server.ad.domain.tld@AD.DOMAIN.TLD
            renew until 26.11.2024 17:40:19
    19.11.2024 17:40:19  20.11.2024 03:40:19  HOST$@AD.DOMAIN.TLD
            renew until 26.11.2024 17:40:19
    19.11.2024 17:40:19  20.11.2024 03:40:19  krbtgt/AD.DOMAIN.TLD@AD.DOMAIN.TLD
            renew until 26.11.2024 17:40:19

If you do not have a ticket please debug your kerberos setup. You can use `kinit` to manually ask for a ticket.

**Note that it is absolutely crucial to receveive a kerberos ticket as access to the remote share can only be done using ticket authentication. If `klist` does not show a ticket please verify your Kerberos configuration.**



# Installation
Use `pacman` to install the package on a pre-build binary package or use `makepkg -fi` within the source tree to build the package yourself.

## Install using pacman
Simply run:

    pacman -U <roaming-profiles-*.pkg.tar.zst>

## Install using makepkg
Simply run from the directory containing `PKGBUILD`:

    makepkg -fi

## Manual install and other distributions (non-Arch-Linux)
### Copy files
Install files into correct directories:

    src/usr/lib/systemd/user/roaming-profiles.service       --> /usr/lib/systemd/user/roaming-profiles.service
    src/usr/share/roaming-profiles/sync-properties.template --> /usr/share/roaming-profiles/sync-properties.template
    src/etc/roaming-profiles/profile-filter                 --> /etc/roaming-profiles/profile-filter
    src/etc/roaming-profiles/roaming-profiles.conf          --> /etc/roaming-profiles/roaming-profiles.conf

### Update PAM configuration
The PAM configuration is 


# Configuration

Configuration is pretty simple. Essentially you need an UNC (SMB) path pointing to a share on any Windows or Samba server which is providing storage for the roaming profile. Typically you can sync your complete home directory but you can also chose to synchronize only a single sub-folder.

Here's a sample configuration `/etc/roaming-profiles/roaming-profiles.conf`

    # Local directory to be synced when logging on/off.
    SYNC_LOCAL="${HOME}/"

    # Remote filesystem path to be mounted.
    SYNC_REMOTE_PATH=smb://server.ad.domain.tld/${LOGNAME}

    # Mountpoint where gio is mounting the remote filesystem.
    SYNC_MOUNTPOINT="${XDG_RUNTIME_DIR}/gvfs/smb-share:server=server.ad.domain.tld,share=${LOGNAME}"

    # Path where remote profile is located. Typically sub-directory of the mountpint or mountpoint itself.
    SYNC_REMOTE="${SYNC_MOUNTPOINT}/linux-profile/"

Note: The `SYNC_MOUNTPOINT` path is auto-generated by `gio mount`. The roaming-profile tool essentially only needs `SYNC_LOCAL` and `SYNC_REMOTE` paths to sync at logon/logoff and needs the UNC path to be mounted in `SYNC_REMOTE_PATH`variable.

In this example the script will user-mount the share at `\\server.ad.domain.tld\<usernsme>` so `gio` will make it available at `/run/user/<uid>gvfs/smb-share:server=server.ad.domain.tld,share=<username>`.
Then it will sync the full contents of the `linux-profile` subfolder do the local home directory and unmount the share after.
On logout it will mount the same UNC path again and sync the local folder to the remote folder.