# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-styles-artwork
pkgver=1.0.0
pkgrel=1
pkgdesc='Some theme and icon styles for Cinnamon. Based on mint-artwork'
arch=('any')
url="https://github.com/linuxmint/mint-artwork"
license=('GPL3')
depends=('bibata-cursor-theme'
    'cinnamon'
    'mint-l-icons'
    'mint-l-theme'
    'mint-x-icons'
    'mint-y-icons'
    'mint-themes')
optdepends=('lightdm-slick-greeter-mint-theme: Additional options')
conflicts=(mint-artwork)
source=("00_mint-x.styles"
        "00_mint-y.styles")
sha256sums=('c68c276279c1056792127acd2d4b1408a7e4b3bdc677f2cce31f338dede9a267'
            '08b906701cf73e5bae20d2303e8a0a2a348e571f15d4d2ae42e4a77160a6ef96')
package() {

    # Installing Mint-X separate style
    install -Dm644 "${srcdir}/00_mint-x.styles" -t "${pkgdir}/usr/share/cinnamon/styles.d/"

    # Installing Mint-Y separate style
    install -Dm644 "${srcdir}/00_mint-y.styles" -t "${pkgdir}/usr/share/cinnamon/styles.d/"
}

