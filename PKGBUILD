# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=bmc
pkgver=0.4
pkgrel=1
pkgdesc="Simple script to download and store your articles."
arch=('any')
url="https://github.com/Phyks/BMC/"
license=('custom')
depends=('python' 'python-pypdf2' 'python-bibtexparser' 'python-socks' 'python-isbnlib' 'python-arxiv2bib')
makedepends=('python-setuptools')
#checkdepends=('python-nose')
source=(https://github.com/Phyks/BMC/archive/v$pkgver.zip)


build() {
  cd "$srcdir/BMC-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/BMC-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
md5sums=('20013cee194d02d02c5be89d2f28dfbf')
