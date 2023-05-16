# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=13.3.0-10944
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
md5sums_x86_64=('1f40047e412e2437ad85613ffca091e5')
sha256sums_x86_64=('840a2a45f5c19e062edc0be03eca0ee272f875e340cdc7fd7c2d1cf3f6df70f5')
sha512sums_x86_64=('109cccb4014e46934ecc666412900d2e95de85ade09dd481dc30b646d6eed768d2a5d4ee14333c1574b2c008dfafae93732be567eccaa10439e9f597586468ec')
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
