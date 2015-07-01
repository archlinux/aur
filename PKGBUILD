# Maintainer: Parantapa Bhattacharya <pb at parantapa dot net>
pkgname=ttf-inconsolata-gwf
pkgver=1.014
pkgrel=2
pkgdesc='Hinted TrueType Inconsolata including a Bold variant provided by Googlewebfonts.'
arch=('any')
url='https://github.com/google/fonts/tree/master/ofl/inconsolata'
license=('SIL OPEN FONT LICENSE Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-inconsolata')
install=$pkgname.install

source=('https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf'
        'https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/ofl/inconsolata/OFL.txt')

md5sums=('631f4ecd69f75ecc4c543b38da8f1b9c'
         'e156a118727053f0f6072d0ee05a48eb'
         '8bd55055b948c7d36f3b1f86eb3b6841')

package() {
    install -Dm644 "${srcdir}/Inconsolata-Regular.ttf" "$pkgdir"/usr/share/fonts/TTF/Inconsolata-Regular.ttf
    install -Dm644 "${srcdir}/Inconsolata-Bold.ttf" "$pkgdir"/usr/share/fonts/TTF/Inconsolata-Bold.ttf
    install -Dm644 "${srcdir}/OFL.txt" "$pkgname"/usr/share/licenses/ttf-inconsolata-gwf/LICENSE
}
