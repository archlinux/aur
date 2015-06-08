# Maintainer: Sean Bartell <archlinux@yotann.org>
# Contributor: Daenyth <Daenyth+Arch _AT_ gmail _DOT_ com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: sh

pkgname=uqm-remix
pkgver=0
pkgrel=3
pkgdesc="Remix music packs for Ur-Quan Masters (uqm)"
arch=(any)
url="http://sc2.sourceforge.net/downloads.php"
license=(GPL)
depends=('uqm>=0.7.0')
source=(http://downloads.sourceforge.net/sourceforge/sc2/uqm-remix-disc{1..4}.uqm)
noextract=(uqm-remix-disc{1..4}.uqm)
md5sums=('09f242d8d72166d1d5ccbd3d99c93e7d'
         'fbc8bdcb709939d559d8c7216ad15cc2'
         '5ccc6d4ac301ae98e172ac6835dcdead'
         'd3dc6036588662391a3820ca6b222dd6')
sha256sums=('b697694745d939311e8ebffdd5edf692e010c25d7966e1481074940a4d0487e8'
            '7fbb4744102e31273e4459b01a156da052ec537c128fe91793643e348bc1bade'
            'e6d89f8f66cf1df1cb278fca1e92261b1776ee670dff26132e33f14dbd31e91d'
            'a4c8197712a5b72a81c7ef7a2a33ea7d3ac90ab063c929dd68e7328a559a86d0')

package() {
    for f in uqm-remix-disc{1..4}.uqm
    do
        install -Dm644 $f \
        $pkgdir/usr/share/uqm/content/addons/$f
    done
}
