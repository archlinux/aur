# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=15.5.0-12409
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
md5sums_x86_64=('948d09d6911b96d45824fc3dd40d462a')
sha256sums_x86_64=('abc4e8b6f0aac320a697b44ea7d419e5b4058ddacd449a4912a78e3e6c95d8f6')
sha512sums_x86_64=('81487ee277b9d9f4a90bec6fcfeb0b1d885816ca20aefd3278e37fe1aa9cdcfa1d1d47433670186728480050d184df326feb39fa7406ed357c70da303a98cec8')
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
