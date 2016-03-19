# Maintainer: OS Hazard <oshazard+aur@gmail.com>
pkgname=withlock
pkgver=0.5
pkgrel=1
pkgdesc="A locking wrapper script to make sure that some program is not run more than once"
url="http://github.com/poeml/withlock"
license=('Apache')
arch=('any')
makedepends=('')
depends=('python')
provides=('withlock' 'withlock-svn')
replaces=('withlock-svn')
source=("https://github.com/poeml/withlock/archive/master.tar.gz")
md5sums=('c9e6cd3e5919115a06fa578894f800fc')

package() {
  cd "${srcdir}/withlock-master"

  # Install script
  mkdir -p "$pkgdir/usr/bin"
  install -m755 withlock "$pkgdir/usr/bin/withlock"

  # Install license
  mkdir -p "${pkgdir}/usr/share/licenses/withlock"
  install -m644 LICENSE-2.0.txt ${pkgdir}/usr/share/licenses/withlock/LICENSE
}
