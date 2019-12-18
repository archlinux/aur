# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=konsole-gruvbox
pkgver=1.01
pkgrel=1
pkgdesc="Konsole dark and light color schemes based on Gruvbox palette"
arch=('any')
url="https://github.com/morhetz/gruvbox"
license=('MIT')
depends=('konsole')
source=("GruvboxDark.colorscheme"
        "GruvboxLight.colorscheme")
sha256sums=('af89228936f355ab10cdccb4eb1a237f41ff91740310ccc44cac3695eacf8429'
            '0afe40ca64e2cc5e692f700a3389b5e004903f496709e4ff633c0cc1a23c5c1f')

package() {
	install -Dm644 Gruvbox{Dark,Light}.colorscheme -t "$pkgdir/usr/share/konsole"
}
