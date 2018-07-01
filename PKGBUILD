# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=ccdciel
pkgver=0.9.39
pkgrel=1
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64')
url="https://www.ap-i.net/ccdciel"
license=('GPL')
depends=('libpasastro')
provides=('ccdciel')
md5sums=("6aaff4a7b5298418f924957585865c3e")

source=("https://sourceforge.net/projects/ccdciel/files/ccdciel_"$pkgver"/ccdciel-"$pkgver"-1098-linux_"${arch}".tar.xz")

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/ccdciel-"$pkgver"-1098-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
