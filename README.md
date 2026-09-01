# seneka-ebdys-maltepe

Arch Linux packaging for the Maltepe University deployment of Seneka EBDYS.
The package does not redistribute the proprietary Windows application. On
first launch it creates a dedicated Wine prefix and installs the signed
ClickOnce deployment from Maltepe University's EBYS server.

## Usage

Run `seneka-ebdys` or choose **Maltepe Üniversitesi EBYS** from the application
menu. The first launch downloads and installs .NET Framework and the EBDYS
client, so it can take several minutes.

Wine 11 may display an unhandled-exception dialog over the first ClickOnce
security prompt. Choose **Quit** only on that error dialog, then choose
**Install** on the security prompt behind it. This is only needed on the first
installation.

To rerun setup or repair the prefix, run `seneka-ebdys-setup`.

Runtime data is kept under:

- `${XDG_DATA_HOME:-~/.local/share}/wineprefixes/seneka-ebdys-maltepe`
- `${XDG_STATE_HOME:-~/.local/state}/seneka-ebdys-maltepe`
