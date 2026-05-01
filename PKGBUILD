# Maintainer: sakkkurai <zenpawlabs@protonmail.com>
pkgname=skypaw-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Minimal weather CLI for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/sakkkurai/skypaw"
license=('MIT')
provides=('skypaw')
conflicts=('skypaw')

source_x86_64=("skypaw::${url}/releases/download/v${pkgver}/skypaw_linux_amd64")
source_aarch64=("skypaw::${url}/releases/download/v${pkgver}/skypaw_linux_arm64")

sha256sums_x86_64=('000169b9c4f800c3aacdad1ad55b16109d476c925fe9891d12a07892e0f392b5')
sha256sums_aarch64=('09433b6b0647b8962f6259b395275328472da675413240bb96b8f898c37fb26a')

package() {
    install -Dm755 "${srcdir}/skypaw" "${pkgdir}/usr/bin/skypaw"
}
