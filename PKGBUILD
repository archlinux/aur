# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=indistarter
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple program to run a INDI server"
arch=('x86_64')
url="https://sourceforge.net/projects/indistarter"
license=('GPL3')
depends=('libindi' 'gtk2' 'glib2' 'pango')
provides=('indistarter')
md5sums=("65dee33958f95c94f2cddeb58b6caea9")

source=("https://sourceforge.net/projects/indistarter/files/indistarter-"$pkgver"/indistarter-"$pkgver"-101-linux_"${arch}".tar.xz")

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/indistarter-"$pkgver"-101-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
