# Maintainer: Yago Mont' Alverne <yagocl@protonmail.ch>
pkgname=nvoc
pkgver=1.0.2
pkgrel=1
pkgdesc="Saves nvidia overclocking settings to automatically apply them on session start, without hanging around as a background process."
arch=('any')
url="https://github.com/yagoplx/nvoc"
license=('GPL')
source=(https://github.com/yagoplx/nvoc/archive/1.0.2.tar.gz)
md5sums=('5fe52191c13916ad74a6d6926f5e42c5')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin/
  cp nvoc $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/nvoc.d/
  cp gpu0.conf $pkgdir/etc/nvoc.d/
}

