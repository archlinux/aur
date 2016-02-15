# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=mopidy-youtube
_pkgname="mopidy-mopidy-youtube-cdca5ab"
pkgver=v2.0.2
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube"

arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=('mopidy>=1.0' 'python2-pykka>=1.1' 'python2-pafy' 'python2-requests')
makedepends=('python2' 'python2-setuptools')
conflicts=("mopidy-youtube-git")

source=("$pkgname-$pkgver.tar.gz::https://github.com/dz0ny/mopidy-youtube/tarball/$pkgver")
md5sums=('bbf918f32a79a56750f1430e5ea9e3d5')
sha1sums=('fe5eca108b9db0fbbc4f948ce00c92b4a6c53d94')

package() {
  cd "$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
