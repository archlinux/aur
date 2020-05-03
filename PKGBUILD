# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
_pkgname="natumbri-mopidy-youtube-00c2162"
pkgver=v3.0.0
pkgrel=1
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

source=("$pkgname-$pkgver.tar.gz::https://github.com/dz0ny/mopidy-youtube/tarball/$_pkgver")

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('0cb0ba0d6a4928bd635dc244e2c66ff5')
sha1sums=('3a5e1625e1b4cfd1d8556ca39fd34741ca6eb542')
