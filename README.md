# Slack (Unofficial AUR Package)

This is an unofficial PKGBUILD for Slack’s official desktop client, built specifically for Arch Linux and Arch-based distributions.

The package does **not** redistribute Slack binaries. Instead, it fetches the latest official `.rpm` release from Slack’s CDN at build time, extracts it, and installs it properly on Arch systems.

---

## 🔧 Installation

To install this package using an AUR helper:

```bash
yay -S slack
```

Slack will be downloaded directly from the official Slack CDN and installed.

---

## 🆕 Updating the PKGBUILD (for maintainers)

To update the package with the latest version of Slack:

```bash
./update-slack.sh
makepkg -si
```

This script will:
- Fetch the latest `.rpm` download URL from Slack
- Extract the version number automatically
- Update the `pkgver` and `source` fields in the `PKGBUILD`
- Regenerate the `.SRCINFO`
- Download the `.rpm` and install the package

This process ensures the AUR package always stays up-to-date with Slack’s latest release.

---

## 📦 Package Details

- **Upstream Website:** [https://slack.com](https://slack.com)
- **Download Source:** [https://downloads.slack-edge.com](https://downloads.slack-edge.com)

The RPM file is not modified in any way. All extracted files are installed as-is under appropriate paths like `/usr/bin`, `/usr/lib/slack`, and `/usr/share`.

---

## 👤 Maintainer

[albertfast](https://github.com/albertfast)

---

## ⚖️ License

This package uses the [Slack Terms of Service](https://slack.com/intl/en-tr/terms-of-service).
The Slack binary files are copyrighted by Slack Technologies, LLC.  
This package does not include, modify, or redistribute any binaries. It simply automates fetching and installation from Slack's official servers.

This PKGBUILD and associated helper scripts (`update-slack.sh`) are provided under the MIT License.  
See [LICENSE](./LICENSE) for details.
