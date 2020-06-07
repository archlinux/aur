# Maintainer: j.e. <patriot.game@gmail.com>
# Contributer: j.b.
pkgname=yoink
pkgdesc="Update all AUR packages in a target directory."
pkgver=0.0.2
pkgrel=1
url="https://github.com/jpe90/yoink"
arch=('i686' 'x86_64')
source=(https://github.com/jpe90/$pkgname/releases/download/v$pkgver/$pkgname)
md5sums=(77fe6a0f0c15c19865ccf2fb569dc4dc)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/yoink"
}
