# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Adam Goldsmith <adam@adamgoldsmith.name>
pkgname=python2-sarge
_name=sarge
pkgver=0.1.4
pkgrel=1
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://bitbucket.org/vinay.sajip/sarge"
license=('GPL')
makedepends=('mercurial')
depends=('python2')
conflicts=('python2-sarge-git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('59f93216723ddd9062d17cbbb90ed9e69267b84825cf0bde0b7f8d934c424823')

package() {
  cd "$srcdir/sarge-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
