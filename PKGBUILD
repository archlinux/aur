# Maintainer: Light Ning <lightning1141@gmail.com>

pkgname=cproxy-bin
pkgver=4.3.0
pkgrel=0
pkgdesc="Easy per application transparent proxy built on cgroup."
url="https://github.com/light4/cproxy"
arch=(x86_64 aarch64)
license=(AGPL)
depends=()
provides=('cproxy')
conflicts=('cproxy')

source_x86_64=("https://github.com/light4/cproxy/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-linux-gnu")
source_aarch64=("https://github.com/light4/cproxy/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-linux-gnu")

sha256sums_x86_64=('d1993e5d97f25b76f6e4f4e6b74aee47b593f0fc524344789e0e4f490ac42f96')
sha256sums_aarch64=('a5c7d5995952f14eac0e61f37e9c8b06f7b8f3536ba9898c9033d8fb0cfc8bc3')

package() {
  install -Dm4755 "${srcdir}/${pkgname/-bin/}-v${pkgver}-${CARCH}-linux-gnu" "$pkgdir/usr/bin/${pkgname/-bin/}"
}
