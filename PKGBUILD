# Maintainer: Crotok <crotok [at] mailbox [dot] org>
# Contributor: SantoZ <santoz28 at mailbox dot org>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

pkgname=ungoogled-chromium-bin
pkgver=75.0.3770.142
pkgrel=1
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency (binary version)"
arch=("x86_64")
url="https://github.com/Eloston/ungoogled-chromium"
license=("BSD")
provides=("chromium")
conflicts=("chromium" "iridium" "ungoogled-chromium")
depends=("gtk3" "nss" "alsa-lib" "xdg-utils" "libxss" "libcups" "libgcrypt"
         "ttf-font" "systemd" "dbus" "libpulse" "pciutils" "json-glib"
         "desktop-file-utils" "hicolor-icon-theme")
optdepends=("gnome-keyring: for storing passwords in GNOME keyring"
            "kdialog: needed for file dialogs in KDE"
            "kwallet: for storing passwords in KWallet"
            "pepper-flash: support for Flash content")
source=("https://github.com/rtMis/ungoogled-chromium-binaries/releases/download/${pkgver}-${pkgrel}/ungoogled-chromium-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
sha256sums=("5405deb13e7cdefe1e767a57beee9eae09fd4b4fcf6d46e91a9190e1a56fb96e")

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
}
