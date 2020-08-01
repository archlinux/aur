# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
_pkgname="mopidy-youtube-3.1"
pkgver=v3.1.0
_pkgver=v3.1
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

md5sums=('8b5be5f43408b409df3cc8102ad2f6e0')
sha1sums=('55f08fa302d7f88a782830066cb1bc0f1595832c')
