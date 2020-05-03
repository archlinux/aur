# Maintainer: Ridales
# Contributor: Caio Novais <caionov08 at gmail dot com>
# Contributor: SuperITMan <admin at superitman dot com>
# Binary releases provided by zocker160: https://github.com/zocker-160/ungoogled-chromium-binaries
pkgname=ungoogled-chromium-bin
_zockerrel=1
pkgver=81.0.4044.122
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency (binary version)"
arch=('x86_64')
url="https://github.com/Eloston/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme' 'jsoncpp' 'openjpeg2'
	 'minizip' 'snappy' 're2')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
conflicts=("chromium" "ungoogled-chromium")
provides=("chromium")
source=("https://github.com/zocker-160/ungoogled-chromium-binaries/releases/download/${pkgver}-${_zockerrel}/ungoogled-chromium-${pkgver}-${_zockerrel}-${arch}.pkg.tar.xz")
sha256sums=("SKIP")

# Copy files
package() {
   cp -r "$srcdir/usr" "$pkgdir"
}
