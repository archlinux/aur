# Maintainer: mib <mib@kanp.ai>
pkgname=4nec2-bin
pkgver=5.9.3
pkgrel=1
pkgdesc="NEC based antenna modeler and optimizer (using Wine)"
arch=('x86_64')
url="https://www.qsl.net/4nec2"
license=('unknown')
depends=('wine' 'winetricks' 'wine-gecko')
makedepends=('unzip')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('4nec2.sh' 'https://qsl.net/4nec2/4nec2zip.zip')
sha256sums=('4d329f4217997b16649387caed63407c388baae88a71018fe991bad38875efba'
            'e8180b923e4ca26344ee8acc4310d24411689382e2d164a1a2fd88f7c75c260a')

package() {
    install -dm 755 "$pkgdir/opt/4nec2/"
    cp -r "$srcdir/4nec2" "$pkgdir/opt"

    install -Dm 755 "4nec2.sh" "$pkgdir/usr/bin/4nec2"
}
