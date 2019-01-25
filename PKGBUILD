# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=indistarter
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple program to run a INDI server"
arch=('x86_64')
url="https://sourceforge.net/projects/indistarter"
license=('GPL3')
depends=('libindi' 'gtk2' 'glib2' 'pango')
provides=('indistarter')
md5sums=("97cf034247e4912da6aca0d53b14d69a")

source=("https://sourceforge.net/projects/indistarter/files/indistarter-"$pkgver"/indistarter-"$pkgver"-129-linux_"${arch}".tar.xz")

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/indistarter-"$pkgver"-129-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
