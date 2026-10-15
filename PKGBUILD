# Maintainer: Adria <adria@lightpanda.io>
pkgname=lightpanda-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="The headless browser designed for AI and data scripting"
arch=('x86_64' 'aarch64')
url="https://github.com/lightpanda-io/browser"
license=('AGPL-3.0')
provides=('lightpanda')
conflicts=('lightpanda')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-x86_64-linux")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/lightpanda-io/browser/releases/download/${pkgver}/lightpanda-aarch64-linux")

sha256sums_x86_64=('551747e35c51ba107b5d5277eca4b48e077b2a3b40f09a047bf6670448bc35fd')
sha256sums_aarch64=('392ba370c12d9f045c36c1477db8b3e2985942c89532732ef8d1610057db7d5c')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lightpanda"
}
