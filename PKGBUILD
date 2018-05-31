# Maintainer: Niklas Yann Wettengel <niyawe at niyawe dot de>
# upstream URL: https://github.com/AnthonyBloomer/tmdbv3api

pkgname=python-tmdbv3api
_realname=tmdbv3api
pkgver=0.8.0
pkgrel=0
pkgdesc="A lightweight Python library for The Movie Database (TMDb) API."
url="https://pypi.org/project/tmdbv3api"
arch=('any')
depends=('python' 'python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/tmdbv3api/$_realname-$pkgver.tar.gz")
md5sums=('76ec73000c7e16e8b3c61c4c0b61f7e7')

package(){
  cd "$_realname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
