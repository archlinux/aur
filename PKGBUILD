# Maintainer: Yago Mont' Alverne <yagocl@protonmail.ch>
pkgname=nvoc
pkgver=1.0.3
pkgrel=3
pkgdesc="Saves nvidia overclocking settings to automatically apply them on session start, without hanging around as a background process."
arch=('any')
url="https://github.com/yagoplx/nvoc"
license=('GPL')
depends=('bash')
optdepends=('nvidia-settings')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yagoplx/nvoc/archive/1.0.3.tar.gz")
md5sums=('cd9bd790997f3283c00a8fd6b28e15c5')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin/
  cp nvoc $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/nvoc.d/
  cp gpu0.conf $pkgdir/etc/nvoc.d/gpu0-preset.conf
}

