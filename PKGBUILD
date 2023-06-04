# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=ccdciel
pkgver=0.9.82
pkgrel=1
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64')
url="https://www.ap-i.net/ccdciel"
license=('GPL')
depends=('libpasastro')
md5sums=("7280c8d219ee6fdd88580ef432c19344")
source=("https://sourceforge.net/projects/ccdciel/files/ccdciel_"$pkgver"/ccdciel-"$pkgver"-2979-linux_"${arch}".tar.xz")

package() {
    mkdir "${pkgdir}"/usr/
    tar -xf "${srcdir}"/ccdciel-"$pkgver"-2979-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
    chown -R root:root "${pkgdir}/usr/"
}
