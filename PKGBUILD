# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
pkgver=v3.2.0
_pkgver=3.2
pkgrel=3
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="https://github.com/natumbri/mopidy-youtube"
license=('APACHE')
depends=(
  'mopidy>=3.1'
  'python-pykka>=2.0.1'
  'python-setuptools'
  'python-requests'
  'python-cachetools'
  'python-beautifulsoup4'
  'youtube-dl>=2020.12.22')
makedepends=('python' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")

package() {
  cd "$pkgname-$_pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('6dc86720870b696ae6ee2592cf59eadf')
sha1sums=('6042a2a6262256eda33db89b891824a8c46569ae')

