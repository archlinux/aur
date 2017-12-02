# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=fortune-mod-limericks
pkgver=3.2
pkgrel=1
pkgdesc="A collection of really funny and perverse limericks."
arch=('any')
url="http://stormdragon.tk/fortunes/limericks"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('038b5cc76fdc015223b4e247ce6841ca')

build()
{
    cd ${srcdir}
    strfile limericks limericks.dat
}

package()
{
    install -D -m644 limericks ${pkgdir}/usr/share/fortune/limericks
    install -D -m644 limericks.dat ${pkgdir}/usr/share/fortune/limericks.dat
}
