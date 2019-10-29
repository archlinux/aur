# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Mihai Coman <mihai@m1x.ro>
# Contributor: Alexander Vynnyk <cosmonaut@mail.ua>

pkgname=skychart-bin
pkgver=4.2
pkgrel=1
pkgdesc="Free software to draw sky charts, also known as Cartes du Ciel"
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'xplanet' 'libpasastro')
url="http://www.ap-i.net/skychart/start"

sha256sums=('97bfb2577d0016af3b451a4209f0c6a525470a155af9238dc9dcb20f5a8f4d1f')

source=(http://sourceforge.net/projects/skychart/files/1-software/version_${pkgver}/skychart-${pkgver}-4046-linux_"${arch}".tar.xz)

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/skychart-"$pkgver"-4046-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
