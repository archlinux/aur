# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0')
provides=('lightpanda')
conflicts=('lightpanda')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('1d40801e72c0bc61b2cbd3f3562bcfc46de7b79e0568f33f686b64f2e587610a')
sha256sums_aarch64=('664775c7f5ab69cc3189954c7f9345e25c167cb4dace016173e629f9a5e82c42')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
