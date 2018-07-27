# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=bashtuner
pkgver=v2018.07.27
pkgrel=1
pkgdesc="A guitar tuner written in bash with several tunings, and support for some other stringed instruments"
arch=('any')
url="https://github.com/stormdragon2976/$pkgname"
source=("${url}/archive/${pkgver}.tar.gz")
license=('unlicense')
depends=('dialog' 'sox')
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('f40fd772a8ecb0a12f67d77d34aa1fe8')

package()
 {
  tar xf ${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
