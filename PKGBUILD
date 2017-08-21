# Maintainer: Muhkoenig

pkgname=nerd-fonts-bitstream-vera-mono
pkgver=1.1.0
pkgrel=1
pkgdesc="Patched font Bitstream Vera Mono from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils' 'wget')
install=$pkgname.install
source=(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/BitstreamVeraSansMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha256sums=(
    'e984c2c1e9971555c061b95c8c247c391cb3c0795346d8a56e2f36790e62ac44'
    'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
