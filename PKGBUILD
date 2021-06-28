# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=fortune-mod-limericks
pkgver=4.0
pkgrel=1
pkgdesc="A collection of really funny and perverse limericks."
arch=('any')
url="https://billy.wolfe.casa/fortunes/limericks"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('9f3ee197327169546284c6bf2bd3708e')

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
