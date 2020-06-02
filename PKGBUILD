# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=hyperspy-link-traits
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

provides=('hyperspy-link-traits')
conflicts=('hyperspy-link-traits')

source=(https://github.com/hyperspy/link_traits/archive/v$pkgver.zip)
sha256sums=('9a7886baa676eaf99e47448dd50cb8b15dffef81df0cdf42fb23c272be9183da')

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

