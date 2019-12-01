# Maintainer: Arthur Williams <taaparthur at gmail dot com>

pkgname='xsane-xrandr'
pkgver='1.0'
pkgrel=0
pkgdesc='Utility script to create and manage user defined monitors'
url="https://github.com/TAAPArthur/xsane-xrandr"
arch=('any')
license=('MIT')
depends=('xorg-xrandr' )
optdepends=('python3: for the configure command')
source=("https://github.com/TAAPArthur/xsane-xrandr/archive/v1.0.tar.gz")
md5sums=('8b3d453061671839218de64b931ad5e4')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
