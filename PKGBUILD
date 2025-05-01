# Maintainer: progoccidental

pkgname='pass-phrase'
pkgver=1.0
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('a836e1cddee583ed895ed9b3de5101876381fbd8436e22f6becc2c4580ecf69d8ca3bd8b8d1ab7cc326180c399b375943ca6d468c0fd449c720b82791a84a1c0')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
