# Maintainer: xrz <aur@xrzyun.eu.org>
pkgname=cloudflarewarpspeedtest-bin
_appname=CloudflareWarpSpeedTest
pkgver=v1.4.2
pkgrel=1
pkgdesc="⭐WARP IP 优选工具"
arch=(
	'aarch64'
	'x86_64'
)
url="https://github.com/peanut996/CloudflareWarpSpeedTest"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-amd64.tar.gz")
md5sums_aarch64=('5ca462b6f08bd19af7a98832e54059b9')
md5sums_x86_64=('901b52b04f27a6184901e9bcbf91fe24')
package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm755 "${srcdir}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
