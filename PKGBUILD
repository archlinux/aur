# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0')
provides=('lightpanda')
conflicts=('lightpanda')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('ef91606f43c50b1721cc920ebd1792567ab027ec55abca365190e61798ce85ce')
sha256sums_aarch64=('d3caf580e509f180b1a4e4c094db1128890eda948f6935d53a518f6e3a92223d')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
