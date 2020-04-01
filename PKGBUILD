# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=ungoogled-chromium-bin
_pkgname=chromium
_pkgname2=ungoogled-chromium
pkgver=80.0.3987.149
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=('x86_64')
url="https://ungoogled-software.github.io/ungoogled-chromium-binaries/releases/archlinux/"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme' 'jsoncpp' 'openjpeg2')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
conflicts=("$_pkgname" "$_pkgname2")
provides=("$_pkgname")
source=("https://github.com/Chexier/ungoogled-chromium-binaries/releases/download/80.0.3987.149-1/ungoogled-chromium-80.0.3987.149-1-x86_64.pkg.tar.xz")
md5sums=('b27f0d3163f8b8db1549f7c87673cfa3')

# Copy files
package() {
   cp -r "$srcdir/usr" "$pkgdir"
}
