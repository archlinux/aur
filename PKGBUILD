# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-link-traits
pkgshort=link_traits
pkgver=1.0.3
pkgrel=1
pkgdesc="A fork to traitlets' link and dlink to link traits in addition to traitlets." 
arch=('any')
url="https://github.com/hyperspy/link_traits"
license=('BSD-3-Clause')

depends=('python-traits')

#optdepends=()

makedepends=('python-setuptools')

replaces=('hyperspy-link-traits')
conflicts=('hyperspy-link-traits')
provides=('hyperspy-link-traits')

source=(https://github.com/hyperspy/link_traits/archive/v$pkgver.zip)
sha256sums=('0d2b24e548813a453cf8b1e8411b241893d864ded43566aab726de855be32aec')

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

