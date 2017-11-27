# Maintainer: Éric Gillet <eric+aur@linuxw.info>
pkgname=jungle-git
pkgver=1.1.11
pkgrel=1
pkgdesc="AWS operations by cli should be simpler"
arch=('any')
url="AWS operations by cli should be simpler"
license=('MIT')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=('git+https://github.com/achiku/jungle.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/jungle"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
