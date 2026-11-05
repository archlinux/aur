# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=1.0.3
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

sha256sums_x86_64=('53eb34da09159dcf8f04865dbfe3e63e9a652062684495aa7ced5ddd7c82e8b0')
sha256sums_aarch64=('20a5348bf3b6f71e41088223b188552ab550c1b9c9a9cbd8f099e6f7f3d78549')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
