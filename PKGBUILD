# Maintainer: Levinit <levinit at outlook>

pkgname=moonplayer-plugins
pkgver=2022.01.30
pkgrel=1
pkgdesc="Plugins for Moon Player"
arch=('any')
url="https://github.com/coslyk/moonplayer-plugins"
license=('custom')
#depends=('moonplayer')
#makedepends=()

real_ver=continuous-$(echo $pkgver|tr . -)
source=("https://github.com/coslyk/moonplayer-plugins/releases/download/$real_ver/plugins.zip")
sha256sums=('a1cf900758734188f3e25e41ccdc0cd44c88f47d4577a2f834fd8b9a4b61fbf1')

package() {
    install -dm755 ${pkgdir}/usr/share/moonplayer/plugins
    cp $srcdir/*.js  ${pkgdir}/usr/share/moonplayer/plugins/
}
