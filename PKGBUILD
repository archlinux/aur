# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
pkgver=0.9.86
pkgrel=1
_pkgcom=3243
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64')
url="https://www.ap-i.net/ccdciel"
license=('GPL')
depends=('libpasastro' 'qt5pas')
optdepends=('libraw: to open DSLR raw files')
conflicts=('ccdciel-git')
sha256sums=('863279807df2ab6c5f1f8b0fba3614c12893037fa0e0ef55f72edd8b1febc558')
source=("https://sourceforge.net/projects/ccdciel/files/ccdciel_"$pkgver"/ccdciel-"$pkgver"-${_pkgcom}-linux_"${arch}".tar.xz")

package() {
    mkdir "${pkgdir}"/usr/
    tar -xf "${srcdir}"/ccdciel-"$pkgver"-${_pkgcom}-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
    chown -R root:root "${pkgdir}/usr/"
}
