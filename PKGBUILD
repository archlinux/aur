# Maintainer: Amanoel Dawod <amanoel at outlook dot com>

pkgname=konsole-gruvbox
pkgver=1.00
pkgrel=1
pkgdesc="Gruvbox dark and light color schemes for Konsole"
arch=("any")
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=("konsole")
source=('GruvboxDark.colorscheme'
        'GruvboxLight.colorscheme')
sha256sums=('e612f56f5fe7ff638eabfd0faa3fb9c2efed90cc8ba4868e9cc8f7e002c20a54'
            'e6e862bbf845ad9cc3e1ce4c554f2d17549004e35356e4bb7e77ea4d92b776da')

package() {
    install -Dm644 Gruvbox{Dark,Light}.colorscheme -t "$pkgdir/usr/share/konsole"
}
