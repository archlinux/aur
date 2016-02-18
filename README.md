# purple-gnome-keyring

Plugin for your purple based instand messenger like Pidgin or Finch.
This plugin seemlessly integrates the Gnome Keyring with your instant messanger. Therefore your password are stored securely - since Pidgin itself stores passwords in plaintext.

## Usage
### Installation
- Clone repo
- Call `make`
- Call `make install` (Currently installs plugin locally)

### Integration
- Go to plugin page in the menu: `Tools->Plugins` or `with Ctrl+U`
- Enable plugin `Gnome Keyring Plugin`
- Optional: Configure plugin, e.g. to use with a separate keyring
- To move all currently active passwords to the keyring, hit
    - `Save all passwords to keyring` in menu: `Tools->Gnome Keyring Plugin`

## Progress
### Features
- Store passwords in an abitrary keyring
- Load passwords when plugin loaded
- Move or delete all passwords to / from Gnome Keyring at once
    - Actions are available in menu: `Tools->Gnome Keyring Plugin`
- Signal handling when account is created / deleted
    - If enabled in preferences, passwords of new accounts are automatically stored in the Gnome Keyring

### TODO
- Create Keyring if given keyringname does not exists
- Signal handling when account password was changed

### Testing
- Tested with Pidgin without any issues
- Tested with Finch without any issues

## Known issues
### Prevent issues
- Make sure that Gnome Keyring is running
- Make sure thad DBUS in running
