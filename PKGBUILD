# Maintainer: loupzeur <loup@loupzeur.net>
pkgname=speedifyui
_pkgver=14.9.3-12127
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
md5sums_x86_64=('c42bc2fdbff6da767583d03b3a2e834a')
sha256sums_x86_64=('0ddb5d416cb4c732b96be9bf9b183476d861960bd889e02be1327f03abbf8e9d')
sha512sums_x86_64=('da80909b508e14b53f9241286d17e7e14c266af0fc54cdc51f3830c7283a745e7c2575c28cfb9a5da45f958f136174bf3ea69e40eab8fb75bd18d75ce56f21b3')
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
