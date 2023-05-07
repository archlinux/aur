# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
pkgver=3.6.0
_pkgver=3.6
pkgrel=2
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
  'youtube-dl>=2021.06.01'
  'python-ytmusicapi>0.19')
makedepends=('python' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")

package() {
  cd "$pkgname-$_pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('716ae56d95884445630e51c2199541d0')
sha1sums=('7f914f51db0af97f31d29b1a409fef2dfd322ab2')
