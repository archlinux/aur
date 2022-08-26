#  Maintainer: Blair Bonnett (blair dot bonnett at gmail dot com)
# Contributor: Muhkoenig

pkgname=nerd-fonts-bitstream-vera-mono
pkgver=2.2.0
pkgrel=2
pkgdesc="Patched font Bitstream Vera Mono from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('OFL')
source=(
    "BitstreamVeraSansMono-v$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/BitstreamVeraSansMono.zip"
    "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/LICENSE"
)
sha256sums=(
    '4d92ff3e8feaad304896fe8c68ae372e32daf689d477fa280ed9da02343d8864'
    '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360'
)

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
