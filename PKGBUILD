# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: William Díaz <wdiaz [at] archlinus [dot] us>
# Contributor: Darío Andrés Rodríguez <andresbajotierra@gmail.com>

pkgname=ttf-fossfonts
pkgver=0.0.4
pkgrel=2
pkgdesc="A collection of 108 free GPL and Public Domain fonts."
arch=('any')
url="http://mirrors.zoelife4u.org/ttf-fossfonts/"
license=('GPL')
provides=("ttf-barcodes")
replaces=("ttf-barcodes")
install=$pkgname.install
source=("http://mirrors.zoelife4u.org/ttf-fossfonts/$pkgname-$pkgver-noarch-52.1.tgz")
md5sums=('fc50d41077f58f5edc62769e13092a9a')

package() {
  cd "$srcdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp * "$pkgdir/usr/share/fonts/TTF"
}

