# Maintainer: Avery Murray <averylapine@gmail.com> 

pkgname=ungoogled-chromium-binary
pkgver=87.0.4280.88
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
source=("https://github.com/mcstrugs/ungoogled-chromium-binaries/releases/download/${pkgver}-${pkgrel}/ungoogled-chromium-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
sha256sums=("e882de51fbe927babdbf1c147c91ed7056e2fb8512bda24cc117511a2096bced")

# Copy files
package() {
   cp -r "$srcdir/usr" "$pkgdir"
}
