#  Maintainer: Blair Bonnett (blair dot bonnett at gmail dot com)
# Contributor: Muhkoenig

pkgname=nerd-fonts-bitstream-vera-mono
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Bitstream Vera Mono from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('OFL')
source=(
    "BitstreamVeraSansMono-v$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/BitstreamVeraSansMono.zip"
    "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/LICENSE"
)
sha256sums=(
    '8df122fb2fd4e7375cbe81db761fee18a1f256116aa41d033f36c4f066d6c498'
    '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
