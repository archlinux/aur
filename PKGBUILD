# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname=ttf-cascadia-code
pkgver=1910.04
pkgrel=1
pkgdesc="This is a fun, new monospaced font that includes programming ligatures and is designed to enhance the modern look and feel of the Windows Terminal"
arch=('any')
url="https://github.com/microsoft/cascadia-code"
license=('custom:OFL-1.1')
depends=('fontconfig' 'xorg-font-utils')
noextract=()

source=(
  "https://github.com/microsoft/cascadia-code/releases/download/v${pkgver}/Cascadia.ttf"
  "https://github.com/microsoft/cascadia-code/raw/v${pkgver}/LICENSE"
)
md5sums=('be4424ae2b9025062ed0ef751ed23afb'
         'd7c8ce104cefae86ac6fbc55bf0e3f82')


package() {
  cd "$srcdir"
  
  install -Dm644 "Cascadia.ttf" "${pkgdir}/usr/share/fonts/TTF/Cascadia.ttf"
  install -Dm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
