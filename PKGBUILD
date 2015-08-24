# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-fritzconnection-git
pkgver=r24.825d90687d62
pkgrel=1
pkgdesc='Communicate with the AVM FritzBox (python 3 fixes)'
license=('MIT')
arch=('x86_64' 'i686')
url='https://bitbucket.org/kbr/fritzconnection'
makedepends=('python-setuptools')
source=("hg+https://bitbucket.org/Fettlaus/fritzconnection")
sha512sums=('SKIP')

pkgver() {
  cd fritzconnection
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd fritzconnection
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
