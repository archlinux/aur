# Contributor: Piotr Kempa <kosmici-atakuja at wp dot pl>
# Maintainer: Erik Johnson <palehose at gmail dot com>
pkgname=run-mailcap
_srcname=mime-support
pkgver=3.58
pkgrel=1
_ubunturel=ubuntu1
pkgdesc='The mailcap script from Ubuntu repositories'
url='http://packages.ubuntu.com/utopic/mime-support'
arch=('any')
license=('GPL')
depends=('perl')
conflicts=($_srcname)
makedepends=()
source=(http://archive.ubuntu.com/ubuntu/pool/main/m/${_srcname}/${_srcname}_${pkgver}${_ubunturel}.tar.gz)
sha1sums=('85a9a50284e753955d9518bf366143f11529b21d')

package() {
	install -d -m 0755 "$pkgdir/usr/bin"
	install -m 0755 "${srcdir}/mime-support-${pkgver}${_ubunturel}/run-mailcap" "$pkgdir/usr/bin/"
}
