# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=13.0.3-10810
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
md5sums_x86_64=('c59be14fd3d38968155a2d994dc79ddf')
sha256sums_x86_64=('568f9208f2ecc2c2f3d1f0b64c8f598d5e2f49ec7cf638f407c904caff814585')
sha512sums_x86_64=('ea5409679549fe65fe814e40dd7eb7f0100f83c19641a8a2bf9beac1a84c209385e8c0bcb3223263b0f1b97623646ce15ab4ac044de4453a9ff169af6b9cc53f')
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
