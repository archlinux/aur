# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
_pkgname="mopidy-youtube-3.0"
pkgver=v3.0.0
_pkgver=v3.0
pkgrel=2
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="https://github.com/natumbri/mopidy-youtube"
license=('APACHE')
depends=(
  'mopidy>=3.0'
  'python-pykka>=2.0.1'
  'python-setuptools'
  'python-requests'
  'python-cachetools'
  'python-beautifulsoup4'
  'youtube-dl')
makedepends=('python' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('63cbc88f22537f23cdf8155066f02120')
sha1sums=('616a5f242eb5aefa94a8541f3eb9d3c2b71c6f28')
