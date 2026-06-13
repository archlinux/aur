# Maintainer: czyt <czytcn@gmail.com>
pkgname=revpdf-bin
pkgver=4.5.0
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
sha256sums_x86_64=('264cdd3ed551193ff53e5e3cd5565c79c1e4630fda2895183f2a06e1ca984644')
sha256sums_aarch64=('ee4d5ed073b811ffbd51233d5c79ac3d41516d78d84d6db766bf14e29b1b22bf')

package() {
    install -Dm755 "${srcdir}/revpdf_editor-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/revpdf"
}
