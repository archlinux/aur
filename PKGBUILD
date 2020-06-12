# Maintainer: Storm Dragon <support@stormdragon.tk>
pkgname=fortune-mod-confucius
pkgver=20180810
pkgrel=2
pkgdesc="Fortune cookies: Confucius sayings.)"
arch=('any')
url="https://billy.wolfe.casa/fortunes/confucius"
license=('WTFPL')
depends=('fortune-mod')
source=("${url}")
md5sums=('e5fc48907a093b08be2822e82c4bc78a')

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
