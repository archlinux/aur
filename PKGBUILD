# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=fortune-mod-limericks
pkgver=2021.08.21
pkgrel=1
pkgdesc="A collection of really funny and perverse limericks."
arch=('any')
url="https://billy.wolfe.casa/fortunes/limericks"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('c15f85d3e2119cee4a58d3ba2e3851dd')

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
