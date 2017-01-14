# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=da2013ctl
pkgver=0.1
pkgrel=1
pkgdesc="Alternative to razercfg for the DeathAdder 2013"
arch=('i686' 'x86_64')
url="https://github.com/Streetwalrus/da2013ctl"
license=('MIT')
depends=('libsystemd')
makedepends=('git')
source=("https://github.com/Streetwalrus/da2013ctl/archive/v$pkgver.tar.gz")
md5sums=('673bd61584953ef8c3241ae3ccfd389e')
install='da2013ctl.install'

build() {
  cd "${srcdir}/da2013ctl-$pkgver"
  make
}

package() {
  cd "${srcdir}/da2013ctl-$pkgver"
  make install ROOT="${pkgdir}" PREFIX="/usr"
}

# vim:set ts=2 sw=2 et:
