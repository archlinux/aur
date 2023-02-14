# upstream URL: https://github.com/AnthonyBloomer/tmdbv3api
# Maintainer: markuschaaf@gmail.com

_realname=tmdbv3api
pkgname=python-$_realname
pkgver=1.7.7
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

sha256sums=('95c8987e9e0d3b0b0263e3f3c1cb6e594eecf2627564830123652b18f7b64469')
