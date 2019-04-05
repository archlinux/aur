# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-ui
_pkgname=Sia-UI
pkgver=1.4.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://sia.tech/releases/Sia-UI-${_pkgver}.deb")
sha256sums=('bf967ef0889bec5234e60d14617b1cbdbae24125d0a2aa3324d0ef32310e7b3f')

package() {
  cd $srcdir

  bsdtar -xf data.tar.xz -C $pkgdir
  install -d $pkgdir/usr/bin
  ln -s /opt/$_pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}

