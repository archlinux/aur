# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=13.1.0-10834
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
md5sums_x86_64=('44cb0249ca0a090bd34526a08a8855ae')
sha256sums_x86_64=('55166488ebff79f7044bb315869d5d986e9530f04447162b8fa3cdb167ad4330')
sha512sums_x86_64=('8c06942622d00466b832888d9ed9dd2ffca6305d098e8a1d3c738672d8ab052ecb043081a0159ba968fefc57e868f84c5fa76a91b8f2fbf4474089ce44d5cf6a')
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
