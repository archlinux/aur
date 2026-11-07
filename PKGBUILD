# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=17.3.0-12956
pkgver=${_pkgver/-/.}
pkgrel=0
pkgdesc="Use multiple internet connections in parallel"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://speedify.com/"
license=(unknown)
groups=()
depends=( speedify libayatana-appindicator webkitgtk-6.0)
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
md5sums_x86_64=('0c37ab951a21db57f4ef04000f426f80')
sha256sums_x86_64=('5652782b3915f69b424b2c4cb5163cf965ba23f2af302da31c12b6f4968cca20')
sha512sums_x86_64=('4a7bf7069e2e2161c3981cd40b3fa5f3d31f64612fb1d6827b17d7f6061628c9cf5ce83abb1a34ba1ab16109dc1026496bc264078ff90e3f1cf7b9ae1cb037c8')
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
