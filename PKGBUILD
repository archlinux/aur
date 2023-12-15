pkgname=swift-mesonlsp-bin
_pkgname=Swift-MesonLSP
pkgver=3.1.3
pkgrel=1
pkgdesc="A language server for meson"
arch=("x86_64")
url="https://github.com/JCWasmx86/Swift-MesonLSP"
license=("GPL3")
makedepends=()
conflicts=(swift-mesonlsp)
source=("https://github.com/JCWasmx86/Swift-MesonLSP/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('aef1f6b386e517ac31e58286b25c6bd828ad1fc1e6958a18d5cd52a868bdf1aa')


package() {
    install -D ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/COPYING
}
