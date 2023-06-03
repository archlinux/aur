pkgname="vast-astronomical-git"
_pkgname="vast"
pkgver=1.0.0
pkgrel=1
pkgdesc="VaST is a software tool for finding variable objects on a series of astronomical images"
arch=("x86_64")
url='http://scan.sai.msu.ru/vast'
license=('GPL3')
makedepends=('git' 'bc' 'gcc-fortran')
source=("$pkgname::git+https://github.com/kirxkirx/vast.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    make
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/${pkgname}/" "${pkgdir}/opt/${_pkgname}/"
}
