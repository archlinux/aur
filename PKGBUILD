# Maintainer: Niklas Yann Wettengel <niyawe at niyawe dot de>
# upstream URL: https://github.com/AnthonyBloomer/tmdbv3api

pkgname=python-tmdbv3api
_realname=tmdbv3api
pkgver=1.5.1
pkgrel=0
pkgdesc="A lightweight Python library for The Movie Database (TMDb) API."
url="https://pypi.org/project/tmdbv3api"
arch=('any')
depends=('python' 'python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/tmdbv3api/$_realname-$pkgver.tar.gz")
sha256sums=('1ecf28212e1f0d46cfeed0ea1e7668c7186033f82449b50b0756524d324ece31')

package(){
  cd "$_realname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
