# Maintainer: Sasasu <sasasu [at] archlinuxcn.org>

pkgname=juicefs
pkgver=4.3.8
pkgrel=1
pkgdesc="A shared POSIX file system for the cloud"
arch=('i686' 'x86_64')
url="https://juicefs.com/"
license=('custom')
depends=('python')
source=("juicefs-$pkgver-$pkgrel::https://juicefs.com/static/juicefs")
sha512sums=('097a1b99e8aefa050e249cc609fd048ea965de429ae3e8aec3f104fcd3fb5138b030796cd15e6b27a801ef57d013cb9639910913b0043c5da1224a668ab7a626')

build() {
  cd "${srcdir}/"
}

package() {
  cd "${srcdir}/"
  install -Dm755 "${srcdir}/juicefs-$pkgver-$pkgrel" "${pkgdir}/usr/bin/juicefs"
  ln -s "./juicefs" "${pkgdir}/usr/bin/mount.juicefs"
}
