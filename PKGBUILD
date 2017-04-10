# Contributor: Storm Dragon <storm@aur.org>
pkgname=fortune-mod-limericks
pkgver=3.1
pkgrel=2
pkgdesc="A collection of really funny and perverse limericks."
arch=('any')
url="http://stormdragon.tk/fortunes/limericks"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('a1946252cbc3389653192323dbe0bab8')

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
