# Maintainer: Levinit <levinit at outlook>

pkgname=moonplayer-plugins
pkgver=0.1
pkgrel=1
pkgdesc="Plugins for Moon Player"
arch=('any')
url="https://github.com/coslyk/moonplayer-plugins"
license=('GPL3')
depends=('moonplayer' 'python')
makedepends=('git')

source=("git://github.com/coslyk/moonplayer-plugins")
sha512sums=('SKIP')

package() {
    install -dm755 ${pkgdir}/usr/share/moonplayer/plugins
    cp $srcdir/$pkgname/*.py  ${pkgdir}/usr/share/moonplayer/plugins/
}
