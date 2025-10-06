# Maintainer: Maykel Moya <mmoya [at] mmoya [dot] org>

_pkgver=0.0.1-pre-alpha-4
pkgname=robrix-bin
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A multi-platform Matrix chat client written in Rust, using the Makepad UI toolkit and the Robius app dev framework"
arch=('x86_64')
url="https://github.com/project-robius/robrix"
options=(!debug !lto)
source=("https://github.com/project-robius/robrix/releases/download/v${_pkgver}/robrix_${_pkgver}_x86_64.tar.gz")
sha512sums=("e76b98b410ce4086ae5543a180c9047af1b9a073a889d5d67c31042df02a6a128f9bb77586d5a5b50c68ef53a1e7b63b8afa5f36adccc0d2cd9646491c6e9926")
package() {
    cp -r ${srcdir}/usr ${pkgdir}
}
