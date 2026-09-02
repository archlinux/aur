# seneka-ebdys-maltepe

Arch Linux packaging for the Maltepe University deployment of Seneka EBDYS.
The package does not redistribute the proprietary Windows application. On
first launch it creates a dedicated Wine prefix and installs the signed
ClickOnce deployment from Maltepe University's EBYS server.

## Usage

Run `seneka-ebdys` or choose **Maltepe Üniversitesi EBYS** from the application
menu. The first launch downloads and installs .NET Framework and the EBDYS
client, the Microsoft fonts used by Seneka, and the Wine compatibility fixes,
so it can take up to 10 minutes.

Wine 11 may display an unhandled-exception dialog over the first ClickOnce
security prompt. Choose **Quit** only on that error dialog, then choose
**Install** on the security prompt behind it. This is only needed on the first
installation.

To rerun setup or repair the prefix, run `seneka-ebdys-setup`.

The dedicated prefix enables WPF software rendering to fix transparent popup
windows under Wine, enables RGB font smoothing, and installs the font families
referenced by the Seneka, Telerik, and document-viewer assemblies. Missing
Segoe UI text variants are mapped to Tahoma inside this prefix only. Existing
prefixes receive this migration once after upgrading to package release 6.

Runtime data is kept under:

- `${XDG_DATA_HOME:-~/.local/share}/wineprefixes/seneka-ebdys-maltepe`
- `${XDG_STATE_HOME:-~/.local/state}/seneka-ebdys-maltepe`

The package includes the icon extracted from the current Seneka executable as
its initial desktop icon. After ClickOnce installation, the runtime helper
extracts it again from the locally downloaded executable so upstream icon
changes can replace the packaged fallback.
