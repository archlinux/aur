# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
pkgver=v3.3.0
_pkgver=v3.3
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
  'youtube-dl>=2020.12.22'
  'python-ytmusicapi')
makedepends=('python' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")

package() {
  cd "$pkgname-3.3"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('363cc173cc318951d29b7c65c3ee0bea')
sha1sums=('d130bba840951c350ec24bd0de0a1e9831137629')
