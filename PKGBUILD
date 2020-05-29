# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=ccdciel
pkgver=0.9.71
pkgrel=2
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64')
url="https://www.ap-i.net/ccdciel"
license=('GPL')
depends=('libpasastro')
provides = ccdciel
md5sums=("e94db76a0b0a9b445bc940714c87c4a1")

source=("https://sourceforge.net/projects/ccdciel/files/ccdciel_"$pkgver"/ccdciel-"$pkgver"-2227-linux_"${arch}".tar.xz")

package() {
    mkdir "${pkgdir}"/usr/
    tar -xf "${srcdir}"/ccdciel-"$pkgver"-2227-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
    chown -R root:root "${pkgdir}/usr/"
}
