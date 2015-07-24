# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
_pkgname="dz0ny-mopidy-youtube-8d3c65b"
pkgver=v1.0.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy' 'python2-pykka>=1.1' 'python2-pafy' 'python2-requests')
makedepends=('python2' 'python2-setuptools')
conflicts=("mopidy-youtube-git")

source=("$pkgname-$pkgver.tar.gz::https://github.com/dz0ny/mopidy-youtube/tarball/$pkgver")
md5sums=('de254f9a713cbc6a8b6f76fb2c7eac43')

package() {
  cd "$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
