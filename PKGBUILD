# Maintainer: Programador Occidental

pkgname='pass-phrase'
pkgver=1.2
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('41f0792218ff62c8ab335aee80e280196d0be2aeaff4cc4c0f074eac45071bc64c68e73abe8603968adb1cc4f47d316dfae22a2ce3401bbcbd57a69748b0f450')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
