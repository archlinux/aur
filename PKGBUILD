# Maintainer: Storm Dragon <support@stormdragon.tk>
pkgname=fortune-mod-confucius
pkgver=20200529
pkgrel=1
pkgdesc="Fortune cookies: Confucius sayings.)"
arch=('any')
url="https://billy.wolfe.casa/fortunes/confucius"
license=('WTFPL')
depends=('fortune-mod')
source=("${url}")
md5sums=('1690845af5bb55b1193715b729556abc')

build()
{
    cd ${srcdir}
    strfile confucius confucius.dat
}

package()
{
    install -D -m644 confucius ${pkgdir}/usr/share/fortune/confucius
	install -D -m644 confucius.dat ${pkgdir}/usr/share/fortune/confucius.dat
}
