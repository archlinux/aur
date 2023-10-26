# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=14.2.0-11445
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
md5sums_x86_64=('d848ac0494a03632e2611adcc35d64eb')
sha256sums_x86_64=('a8a12ec4c3204479e3a2fbf19ee5bd4f38bccdedaf7a414554dffd139b11a1d2')
sha512sums_x86_64=('76b29b5d38f00b39533fa74c9cff961379cd441c0888b89dbc0ac635aa77c89e50984a61294dcf8a9f85932a24c90b7fa0bb877f6b6c70e3ad6cdb11747c3cf3')
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
