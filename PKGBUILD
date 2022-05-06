# Maintainer: PQCraft <0456523@gmail.com>

pkgname=bcbasic-bin
ghpkgname=BCBASIC
pkgver=0.1.5
pkgrel=1
pkgdesc="ByteCodeBASIC"

#arch=(x86_64 i686)
arch=(x86_64)

url="https://github.com/PQCraft/${ghpkgname}"
license=(GPL3)
depends=('readline')
provides=(bcbasic)
conflicts=(bcbasic)
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x64.zip::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/BCBASIC-Linux-x86_64.zip")

#source_i686=("${pkgname}-${pkgver}-${pkgrel}-x86.zip::https://github.com/PQCraft/${ghpkgname}/releases/download/${pkgver}/BCBASIC-Linux-x86.zip")

sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm755 bcbasic -t "${pkgdir}/usr/bin/"
}

