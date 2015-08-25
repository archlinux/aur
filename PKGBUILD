# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
_pkgname="mopidy-mopidy-youtube-78787af"
pkgver=v2.0.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=1.0' 'python2-pykka>=1.1' 'python2-pafy' 'python2-requests')
makedepends=('python2' 'python2-setuptools')
conflicts=("mopidy-youtube-git")

source=("$pkgname-$pkgver.tar.gz::https://github.com/dz0ny/mopidy-youtube/tarball/$pkgver")
md5sums=('16bb18fa2141c9be637a4e92f3dfc7b5')

package() {
  cd "$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
