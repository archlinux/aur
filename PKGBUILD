# Contributor: Storm Dragon <support@stormdragon.tk>
pkgname=fortune-mod-confucius
pkgver=20100915
pkgrel=2
pkgdesc="Fortune cookies: Confucius sayings.)"
arch=('any')
url="http://stormdragon.tk/fortunes/confucius"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('cd21d241904c473b00f4c630e0208615')

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
