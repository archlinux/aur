# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0')
provides=('lightpanda')
conflicts=('lightpanda')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('8eccc899b00a2b3fef31af89836a05e1ebf177c057ff31dd5b6999f9829a60f6')
sha256sums_aarch64=('90599d12de4dce6671c19cd7fe58d10780bd99411964503589f364d923724cc1')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
