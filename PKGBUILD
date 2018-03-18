# Maintainer: Storm Dragon <support@stormdragon.tk>
pkgname=fortune-mod-confucius
pkgver=20180317
pkgrel=1
pkgdesc="Fortune cookies: Confucius sayings.)"
arch=('any')
url="http://stormdragon.tk/fortunes/confucius"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('669a24f7832bda49ff3b2a64ad09bba0')

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
