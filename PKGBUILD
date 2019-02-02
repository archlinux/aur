# Maintainer: Niklas Yann Wettengel <niyawe at niyawe dot de>
# upstream URL: https://github.com/AnthonyBloomer/tmdbv3api

pkgname=python-tmdbv3api
_realname=tmdbv3api
pkgver=1.3.0
pkgrel=0
pkgdesc="A lightweight Python library for The Movie Database (TMDb) API."
url="https://pypi.org/project/tmdbv3api"
arch=('any')
depends=('python' 'python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/tmdbv3api/$_realname-$pkgver.tar.gz")
md5sums=('9205a5da0fc082b6d0a987a3d977ede9')

package(){
  cd "$_realname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
