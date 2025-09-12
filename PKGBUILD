# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=15.8.2-12611
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
md5sums_x86_64=('7343ec75799edc0b5cf27466fc399aab')
sha256sums_x86_64=('75d0fb4a1e835780efe7a741800085bac71b235eed9079ebcd04a94438cfc091')
sha512sums_x86_64=('b2a61e5e714826f7b28077675a4279154cfed3a575fcc4d3af9150d2cb44cfd399de7d20b44b3bdff9ec424f6a1df3ccbf39353b5bc02370156ebd895779db03')
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
