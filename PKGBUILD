# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=faugus-launcher-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Simple and lightweight app for running Windows games using UMU-Launcher (prebuilt)"
arch=('any')
url="https://github.com/Faugus/faugus-launcher"
license=('MIT')
depends=('gtk4' 'libadwaita' 'libmanette' 'icoextract' 'python'
         'python-gobject' 'python-requests' 'python-pillow' 'python-vdf'
         'python-psutil' 'python-dbus' 'umu-launcher')
optdepends=('mangohud: performance overlay'
            'gamemode: feral gamemode integration')
provides=('faugus-launcher')
conflicts=('faugus-launcher')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('5fcf441cccb1ccc0ac554760e93744d557fd05a3fc4335132a59e55aefe902af')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
