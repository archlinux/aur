# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=python-markdownify
_name=markdownify
pkgver=0.9.2
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="http://github.com/matthewwithanm/python-markdownify"
license=('MIT')
makedepends=('python-pip')
depends=('python-beautifulsoup4' 'python-six')
options=(!emptydirs)
source=(https://pypi.io/packages/source/m/$_name/$_name-$pkgver.tar.gz)
sha512sums=('6ee76aa0eedcec1e25a61197d8913a543f9d7ac0a0ca8454d8a0927999d18a6fb77db32589b6bb76976fec69dd523081df339cd512c9881bbe8d69cedd893a02')


package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
