# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=python-markdownify
_name=markdownify
pkgver=0.11.6
pkgrel=1
pkgdesc="Convert HTML to Markdown"
arch=('any')
url="http://github.com/matthewwithanm/python-markdownify"
license=('MIT')
makedepends=('python-pip')
depends=('python-beautifulsoup4' 'python-six')
options=(!emptydirs)
source=(https://pypi.io/packages/source/m/$_name/$_name-$pkgver.tar.gz)
sha512sums=('9ab2bf56981081737e5ed95aa96ec16c2644fecca62763a4ea4ba1f6ebb61b671cecc857abd4a92a738a9762104b2d9beb92b320638d80dca3ad4ee7621d02e7')


package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
