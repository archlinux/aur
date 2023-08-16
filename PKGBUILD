# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=bashtuner
pkgver=2019.04.20
pkgrel=1
pkgdesc="A guitar tuner written in bash with several tunings, and support for some other stringed instruments"
arch=('any')
url="https://git.stormux.org/storm/$pkgname"
source=("git+${url}.git")
license=('unlicense')
depends=('dialog' 'sox')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout v2019.04.20
}

package()
 {
  cd "${srcdir}/${pkgname}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
