# Maintainer: Muhkoenig

pkgname=nerd-fonts-bitstream-vera-mono
pkgver=1.0.0
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
    '3bda2c91fa310646255ce8e143e108e517f7569c3e16689fa1a92db4f6655e97'
    '25f0b18305451ab7353c534098d9daf4051fbedfac6d5ef9be5de42e007e1c3f')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
