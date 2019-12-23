# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Mihai Coman <mihai@m1x.ro>
# Contributor: Alexander Vynnyk <cosmonaut@mail.ua>

pkgname=skychart
pkgver=4.2.1
pkgrel=1
pkgdesc="Free software to draw sky charts, also known as Cartes du Ciel"
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'xplanet' 'libpasastro')
url="http://www.ap-i.net/skychart/start"

sha256sums=('fcf1d19df6e7082c5057342248bc5159847c85ca5a678013f6b6447c036d4520')

source=(http://sourceforge.net/projects/skychart/files/1-software/version_${pkgver}/skychart-${pkgver}-4073-linux_"${arch}".tar.xz)

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/skychart-"$pkgver"-4073-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
