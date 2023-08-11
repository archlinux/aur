# Maintainer: rapiertg <rapiertg@gmail.com>
pkgname=ccdciel
pkgver=0.9.84
pkgrel=1
_pkgcom=3102
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64')
url="https://www.ap-i.net/ccdciel"
license=('GPL')
depends=('libpasastro' 'gtk2')
optdepends=('libraw: to open DSLR raw files')
conflicts=('ccdciel-git')
sha256sums=('8dddd0c16c9d6c1f3026fac78e1cb610d74b8d8e2adb636c426fa72e0f8af324')
source=("https://sourceforge.net/projects/ccdciel/files/ccdciel_"$pkgver"/ccdciel-"$pkgver"-${_pkgcom}-linux_"${arch}".tar.xz")

package() {
    mkdir "${pkgdir}"/usr/
    tar -xf "${srcdir}"/ccdciel-"$pkgver"-${_pkgcom}-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
    chown -R root:root "${pkgdir}/usr/"
}
