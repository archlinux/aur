# Maintainer: Parantapa Bhattacharya <pb at parantapa dot net>
pkgname=ttf-inconsolata-gwf
pkgver=1.016
pkgrel=1
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

md5sums=('b0639eb725c0df94f68b779889679457'
         'c6623d74820bb62d25c969a50bafbb46'
         '8bd55055b948c7d36f3b1f86eb3b6841')

package() {
    install -Dm644 "${srcdir}/Inconsolata-Regular.ttf" "$pkgdir"/usr/share/fonts/TTF/Inconsolata-Regular.ttf
    install -Dm644 "${srcdir}/Inconsolata-Bold.ttf" "$pkgdir"/usr/share/fonts/TTF/Inconsolata-Bold.ttf
    install -Dm644 "${srcdir}/OFL.txt" "$pkgname"/usr/share/licenses/ttf-inconsolata-gwf/LICENSE
}
