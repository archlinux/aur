# Contributor: Piotr Kempa <kosmici-atakuja at wp dot pl>
# Maintainer: Erik Johnson <palehose at gmail dot com>
pkgname=run-mailcap
_srcname=mime-support
pkgver=3.60
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
sha1sums=('540e9a76611fe30dc9414c3ab61ad5595149660b')

package() {
	install -d -m 0755 "$pkgdir/usr/bin"
	install -m 0755 "${srcdir}/mime-support-${pkgver}${_ubunturel}/run-mailcap" "$pkgdir/usr/bin/"
}
