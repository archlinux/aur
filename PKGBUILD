# Maintainer: czyt <czytcn@gmail.com>
pkgname=revpdf-bin
pkgver=4.6.5
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
sha256sums_x86_64=('fe2d91424b043ae07e0b351c22299442d7de7baf076aea1a19ada4a6df0afd7f')
sha256sums_aarch64=('c1dc511f374a97d28b24cf251f1393873ea34becddee7dcd7a6299f92b3854f6')

package() {
    install -Dm755 "${srcdir}/revpdf_editor-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/revpdf"
}
