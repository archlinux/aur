# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
pkgver=v3.4.0
_pkgver=v3.4
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
  'youtube-dl>=2021.06.01'
  'python-ytmusicapi')
makedepends=('python' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")

package() {
  cd "$pkgname-3.3"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('d9d9ba63c25f95b61c9442b8f9f9d3df')
sha1sums=('8834541e4d49533affd7844c5095d0e54bd95dc3')
