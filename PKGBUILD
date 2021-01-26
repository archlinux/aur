# Maintainer: BootyBlaster

pkgname=ttf-jam-icons
pkgver=2.1
pkgrel=1
pkgdesc="A set of icons designed for web projects, illustrations, print projects, etc."
arch=('any')
url="https://jam-icons.com"
license=('MIT')
depends=('fontconfig')
source=(
    "https://raw.githubusercontent.com/wannesdemeyer/jam/master/fonts/jam-icons.ttf"
    "https://raw.githubusercontent.com/wannesdemeyer/jam/master/LICENSE"
)
md5sums=('e3b6396ce554c77bd9655e12ca0690ed'
         'a53b17fccc67f4f5b1e52a3e389661a2')

package() {
    install -d "${pkgdir}"/usr/share/fonts/TTF
    install -Dm644 "${srcdir}"/jam-icons.ttf "${pkgdir}"/usr/share/fonts/TTF/jam-icons.ttf
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    install -Dm644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/MIT
}

