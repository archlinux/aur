# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=16.0.2-12731
pkgver=${_pkgver/-/.}
pkgrel=0
pkgdesc="Use multiple internet connections in parallel"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://speedify.com/"
license=(unknown)
groups=()
depends=( speedify libayatana-appindicator webkit2gtk)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
source_x86_64=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_amd64.deb)
source_aarch64=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_arm64.deb)
source_armv7h=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_armhf.deb)
# TODO: i386 is also supported
md5sums_x86_64=('ce9a6f74c64a7b34470fbc0a758290ba')
sha256sums_x86_64=('f5ec6b2dad5bb7f38dcd311d14dc50613b98f6655767fc703b3e96a0b1f3924b')
sha512sums_x86_64=('7149a59c5af24d637cb21bc4446f33fb845362b6524342d3888d7201f16766a84edd0e46a7c669d164ff919945f976411c884ae672f85085886d677c9619cb5b')
md5sums_aarch64=('SKIP')
md5sums_armv7h=('SKIP')

prepare() {
	cd "$srcdir"
	tar -xf "${srcdir}/data.tar.gz"
}

package() {
	cd "${srcdir}"
	cp -rp usr "${pkgdir}/usr"
}
