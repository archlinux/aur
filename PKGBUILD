# Maintainer: Amanoel Dawod <amanoel at outlook dot com>

pkgname=konsole-gruvbox
pkgver=1.00
pkgrel=2
pkgdesc="Konsole dark and light color schemes based on Gruvbox palette"
arch=("any")
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=("konsole")
source=('GruvboxDark.colorscheme'
        'GruvboxLight.colorscheme')
sha256sums=('fa8c9f4c33760cf3aca105f89b64f0804930f4fc8caf32b9daf6e5435a8c7637'
            'cdaee61917d3abab90a5bb902e3e3260ece730ff3640865c990814156e2d04c5')

package() {
    install -Dm644 Gruvbox{Dark,Light}.colorscheme -t "$pkgdir/usr/share/konsole"
}
