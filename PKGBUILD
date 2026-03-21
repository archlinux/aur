# Maintainer: 4Worlds <studio@4worlds.dev>
pkgname=inkwell-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Lightweight Markdown editor with split view, live preview, themes, focus mode, and diff viewer"
arch=('x86_64')
url="https://github.com/4worlds4w-svg/inkwell"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('inkwell')
conflicts=('inkwell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/4worlds4w-svg/inkwell/releases/download/v${pkgver}/inkwell-v${pkgver}-linux-x64.tar.gz")
sha256sums=('827c75cab87ac241f1f4b9591c527b19e9c3c3d8a44b6f792b956cdcb4171333')

package() {
    install -Dm755 "${srcdir}/inkwell" "${pkgdir}/usr/bin/inkwell"
}
