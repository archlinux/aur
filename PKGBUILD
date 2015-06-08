# Contributor: Storm Dragon <storm@aur.org>
pkgname=fortune-mod-limericks
pkgver=3
pkgrel=2
pkgdesc="A collection of really funny and perverse limericks."
arch=('any')
url="http://stormdragon.us/fortunes/limericks"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('063b9c9916003dfb67094998e00b6480')

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
