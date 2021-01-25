# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=ccdciel
pkgver=0.9.74
pkgrel=1
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64')
url="https://www.ap-i.net/ccdciel"
license=('GPL')
depends=('libpasastro')
provides = ccdciel
md5sums=("df6d4522402c4fa0f86ba4192a03c9db")

source=("https://sourceforge.net/projects/ccdciel/files/ccdciel_"$pkgver"/ccdciel-"$pkgver"-2217-linux_"${arch}".tar.xz")

package() {
    mkdir "${pkgdir}"/usr/
    tar -xf "${srcdir}"/ccdciel-"$pkgver"-2217-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
    chown -R root:root "${pkgdir}/usr/"
}
