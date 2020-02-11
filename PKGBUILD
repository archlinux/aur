# Maintainer: Isaac Freund <ifreund@ifreund.xyz>

pkgname=cozette-ttf
pkgver=1.3.1
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/slavfox/Cozette/releases/download/v.$pkgver/CozetteVector.ttf"
        "https://github.com/slavfox/Cozette/archive/v.$pkgver.tar.gz")
sha256sums=('c5f6438898c6cff1b081eb0811eb04a1dfce59125d81311f102d6e85bc1b5ba2'
            '09026d3c9b68cf1ad941b8158cddee6daebd4c4bd845c853c2c9b5ed69ca4c69')

package() {
    install -D -m0644 "$srcdir/CozetteVector.ttf" "$pkgdir/usr/share/fonts/misc/CozetteVector.ttf"
    install -D -m0644 "$srcdir/Cozette-v.$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
