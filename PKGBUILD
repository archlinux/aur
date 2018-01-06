# $Id: PKGBUILD 195848 2016-11-14 17:52:18Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: FJ <joostef@gmail.com>

pkgname=ssh-faker
pkgver=1.1
pkgrel=5
pkgdesc="A whitelisting perl script for sshd."
arch=('any')
license=('GPL')
url="http://www.pkts.ca/ssh-faker.shtml"
depends=('perl' 'openssh')
install=ssh-faker.install
source=("https://www.pkts.ca/$pkgname-$pkgver.tar.gz")
sha256sums=('12dd42e0b8ef98031876cc2e054943c9efd68d47ebfbe6abd15e407b76f90486')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/bin
  install -m755 ssh-faker "$pkgdir"/usr/bin
}
