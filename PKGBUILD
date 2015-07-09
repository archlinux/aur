#Maintainer: Mihai Coman <mihai@m1x.ro>
#Contributor: Alexander Vynnyk <cosmonaut@mail.ua>

pkgname=skychart
pkgver=3.10
pkgrel=1
pkgdesc="Free software to draw sky charts, also known as Cartes du Ciel"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'xplanet')
url="http://www.ap-i.net/skychart/start"
install=skychart.install

case $CARCH in
i686)
       _real_arch=i386
       sha1sums=('76a2276dd7233e2599b1616a64881165bc6dd665')
;;
x86_64)
       _real_arch=x86_64
       sha1sums=('d88b26fc04968e88c58c3ab21990af93f985813f')
;;
esac

source=(http://sourceforge.net/projects/skychart/files/1-software/version_3.10/skychart-3.10-2854-linux_"${_real_arch}".tar.xz)

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/skychart-"$pkgver"-2854-linux_"${_real_arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
}

