# Maintainer: Ossi Saukko <osaukko at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch _AT_ gmail _DOT_ com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: sh

pkgname=uqm-remix
pkgver=0
pkgrel=4
pkgdesc="Remix music packs for Ur-Quan Masters (uqm)"
arch=(any)
url="http://sc2.sourceforge.net/downloads.php"
license=(GPL)
depends=('uqm>=0.7.0')
source=(http://downloads.sourceforge.net/sourceforge/sc2/uqm-remix-disc1.uqm
        http://downloads.sourceforge.net/sourceforge/sc2/uqm-remix-disc2.uqm
        http://downloads.sourceforge.net/sourceforge/sc2/uqm-remix-disc3.uqm
        http://downloads.sourceforge.net/sourceforge/sc2/uqm-remix-disc4-1.uqm)
noextract=(uqm-remix-disc1.uqm
           uqm-remix-disc2.uqm
           uqm-remix-disc3.uqm
           uqm-remix-disc4-1.uqm)
md5sums=('09f242d8d72166d1d5ccbd3d99c93e7d'
         'fbc8bdcb709939d559d8c7216ad15cc2'
         '5ccc6d4ac301ae98e172ac6835dcdead'
         '3fb63f4ac514343ed4b4b5b194c413fb')

package() {
    for f in uqm-remix-disc{1,2,3,4-1}.uqm
    do
        install -Dm644 $f \
        $pkgdir/usr/share/uqm/content/addons/$f
    done
}

