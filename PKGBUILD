# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0-only')
provides=('lightpanda')
conflicts=('lightpanda')
depends=('glibc')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('7d22651129901203abdb95c64f49069c49e88f5211f4d8c4c6828c123c4adab4')
sha256sums_aarch64=('f021d49a0b66d07bf2633f8e00870b9075293516f872695b0ca4aeb5848b6ea8')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
