# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>
pkgname=ttf-spacemono
pkgver=1.0.0
pkgrel=2
pkgdesc='Space Mono font by Colophon (from Google Fonts)'
arch=('any')
url='https://fonts.google.com/specimen/Space+Mono'
license=('SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf-spacemono.install
source=('https://raw.githubusercontent.com/googlefonts/spacemono/master/fonts/SpaceMono-Regular.ttf'
        'https://raw.githubusercontent.com/googlefonts/spacemono/master/fonts/SpaceMono-Bold.ttf'
        'https://raw.githubusercontent.com/googlefonts/spacemono/master/fonts/SpaceMono-Italic.ttf'
        'https://raw.githubusercontent.com/googlefonts/spacemono/master/fonts/SpaceMono-BoldItalic.ttf')
sha256sums=('4c322514d265062aa3f7fbd81f5b79391ccb74268e6a20600061e0ce33234f41'
            '1d36265a139d549efca59711072bbf67f39ae51ae1c94315f0bdc3bb77c8c0eb'
            '6fecfc6b7d792370394d9e85d89b190eb9e6ea6443a7fc866d6e2e66cd5ad570'
            '4a89b64ec4896b3b9046b03cb49d854e381c3f03e44dff50f9861af025f5a26f')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
  install -m 644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
