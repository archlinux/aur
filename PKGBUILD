# Maintainer: czyt <czytcn@gmail.com>
pkgname=revpdf-bin
pkgver=4.0.0
pkgrel=2
pkgdesc="The Best Free Offline PDF Editor"
arch=('x86_64' 'aarch64')
url="https://github.com/Pawandeep-prog/revpdf-release"
license=('custom')
depends=('fuse2')
provides=('revpdf')
conflicts=('revpdf')
source_x86_64=("revpdf_editor-${pkgver}-x86_64.AppImage::https://github.com/Pawandeep-prog/revpdf-release/releases/download/v${pkgver}/revpdf_editor-x86_64.AppImage")
source_aarch64=("revpdf_editor-${pkgver}-aarch64.AppImage::https://github.com/Pawandeep-prog/revpdf-release/releases/download/v${pkgver}/revpdf_editor-aarch64.AppImage")
sha256sums_x86_64=('5093767a07dea94d661baa8d1c9344850c83bc6b871f178fcff6a2968ac92145')
sha256sums_aarch64=('9646de92631ae98146b9f215e4c481afc5789592a50c83d6289eee2f718380df')

package() {
    install -Dm755 "${srcdir}/revpdf_editor-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/revpdf"
}
