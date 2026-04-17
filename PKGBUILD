# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=16.6.1-12922
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
md5sums_x86_64=('b0d068681c26cfe4f74a6be3cbf753d1')
sha256sums_x86_64=('67b909ce26aa02a626caf6ea693210f76d587a364bad6c3e262e6471632ee305')
sha512sums_x86_64=('9157333ec9cacf58c1223b067637a211a7058867d90740925ea93b9077be3274b4543ce2cbf16b9816d5b5b0e2e106d8be8b81d55f28bdb9a52e546134e0d884')
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
