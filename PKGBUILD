# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=easyaur
pkgver=1.2
pkgrel=1
pkgdesc="Easy-to-use wrapper useful for building packages and managing custom repositories"
url="https://github.com/legendary-cookie/easyaur"
license=('GPL')
source=(
    "https://github.com/legendary-cookie/easyaur/archive/refs/tags/$pkgver.tar.gz"
)
arch=('any')
sha256sums=('5e9cbc859baef28f2f9cdc1c65b6c7284cc8800f53de8b7541db136aac6c76b3')
depends=(
	asp git pacman bash
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver/easyaur"
}

#vim: syntax=sh
