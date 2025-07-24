# Maintainer: witt <1989161762 at qq dot com>
pkgname='ttf-source-code-pro-nerd-fonts'
pkgver=3.4.0
pkgrel=1
pkgdesc="SauceCodePro Nerd Font: Patched Source Code Pro font with Nerd Fonts icon set, suitable for terminals and UI environments with ligature support"
arch=('any')
url='https://github.com/adobe-fonts/source-code-pro'
license=('custom')
# makedepends=('git')
source=("sourceCodePro-${pkgver}.tar.xz::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/SourceCodePro.tar.xz")
arch=('any')
conflicts=('ttf-sauce-code-pro-nerd-font')
provides=('SourceCodeProNerdFont' 'SauceCodeProNerdFont' 'ttf-source-code-pro-nerd-fonts' 'ttf-sauce-code-pro-nerd-fonts')
sha256sums=('d52d97b66c4c5d6d9d99c88df55148faf39738f244485026f22f8e47407744f4')

package(){
    find . -type f -name "*.ttf" -exec install -m644 {} -D "${pkgdir}/usr/share/fonts/SourceCodeProNerdFont/"{} \;
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
