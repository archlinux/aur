# Maintainer: Amanoel Dawod <amanoel at outlook dot com>

pkgname=konsole-gruvbox
pkgver=1.00
pkgrel=3
pkgdesc="Konsole dark and light color schemes based on Gruvbox palette"
arch=("any")
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=("konsole")
source=('GruvboxDark.colorscheme'
        'GruvboxLight.colorscheme')
sha256sums=('df484157f89006c8adbaf23e3b76d2315db374b8fd97c13c99cd9e309d495cb1'
            'ec1658920979a45768cfb488a1e5e6c332f7dfe7019342916cd1b993131f4ec6')

package() {
    install -Dm644 Gruvbox{Dark,Light}.colorscheme -t "$pkgdir/usr/share/konsole"
}
