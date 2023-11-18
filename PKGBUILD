# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=14.3.1-11514
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
md5sums_x86_64=('06c7f22a3df5e3f7a70aa32bf9b7b45a')
sha256sums_x86_64=('a7e916970b8f565cce84c7c838578ebe8001808e9b2e917493192b4914d3b397')
sha512sums_x86_64=('51ba045ef83666d846ce9ecb05f14e1b4d3e2703c283b260767b401bde18a94157d32a8b6605653f43b88a920fef35d174ae32704c38d2c7201c97375c99fa41')
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
