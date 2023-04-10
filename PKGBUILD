# Maintainer: Papajoker <papajoke [at] archlinux [dot] info>
pkgname=pachook
pkgver=0.1.4
pkgrel=3
pkgdesc="simple administrator pacman hooks"
arch=('any')
url="https://github.com/papajoker/pachook"
license=('GPL')
depends=('pacman')
makedepends=('git')
source=("$pkgname::git+https://github.com/papajoker/pachook")
md5sums=('SKIP')


package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  #cp -r usr ${pkgdir}/
  cp -r etc ${pkgdir}/
}

