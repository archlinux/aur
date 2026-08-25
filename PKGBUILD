# Maintainer: czyt <czytcn@gmail.com>
pkgname=revpdf-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="The Best Free Offline PDF Editor"
arch=('x86_64' 'aarch64')
url="https://github.com/Pawandeep-prog/revpdf-release"
license=('custom')
depends=('fuse2')
provides=('revpdf')
conflicts=('revpdf')
source_x86_64=("revpdf_editor-${pkgver}-x86_64.AppImage::https://github.com/Pawandeep-prog/revpdf-release/releases/download/v${pkgver}/revpdf_editor-x86_64.AppImage")
source_aarch64=("revpdf_editor-${pkgver}-aarch64.AppImage::https://github.com/Pawandeep-prog/revpdf-release/releases/download/v${pkgver}/revpdf_editor-aarch64.AppImage")
sha256sums_x86_64=('4b275817ed6a4983437bfcb0a7d8a2d25d2903143d2d327960b64589d1c5ae06')
sha256sums_aarch64=('50ec22e67fc4f7c01bc7e6a59846fa8c3db06116c45904ff5b5edba685030dd8')

package() {
    install -Dm755 "${srcdir}/revpdf_editor-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/revpdf"
}
