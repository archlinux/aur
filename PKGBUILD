# upstream URL: https://github.com/AnthonyBloomer/tmdbv3api
# Maintainer: markuschaaf@gmail.com

_realname=tmdbv3api
pkgname=python-$_realname
pkgver=1.9.0
pkgrel=0
pkgdesc="A lightweight Python library for The Movie Database (TMDb) API."
url="https://pypi.org/project/tmdbv3api"
arch=('any')
depends=('python' 'python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/tmdbv3api/$_realname-$pkgver.tar.gz")

package(){
  cd "$_realname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('504c5da6b99c4516ff160a01576112d097f209c0534f943c15c4b56cbd92c33b')
