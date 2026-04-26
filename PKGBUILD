# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=16.6.2-12924
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
md5sums_x86_64=('45be91f6e7e0321490da98256609b4bc')
sha256sums_x86_64=('7f013b6901f04f2731235a429069cb166bb8cdb314f11bd217b9fb81c7e36702')
sha512sums_x86_64=('c0a991b7f45b4a0634eddd44721420146275cf4855244a64884d484d1b3d3c273d97222dec0cadc1988181edbd4f3edd344329049d97198a5d321549b1473e9e')
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
