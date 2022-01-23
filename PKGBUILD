# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
pkgver=v3.5.0
_pkgver=3.5
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

md5sums=('09164211c934cbb72ca46d82d90ab25d')
sha1sums=('712a6e7f57edf353cda96388d509f8a06aab9191')
