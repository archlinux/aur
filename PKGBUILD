# Maintainer: Jonathan Deiss <me@jdeiss.com>

pkgname=mdserve-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Serve a directory of markdown files for easy viewing"
arch=('x86_64')
url="https://github.com/FireSquid6/markdown-preview-server"
license=('MIT')
provides=('mdserve')
conflicts=('mdserve')

source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/mdserve-linux-x64")
sha256sums_x86_64=('59299bacce472f5dbb5f8df2a90abf927ee18e58d2879ee05b798a759810c3f1')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/mdserve"
}
