# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
_pkgcore=jdtls-wrapper
pkgname=${_pkgcore}-bin
pkgver=25.11.1
pkgrel=1
pkgdesc="A Java language server wrapper for Helix editor."
arch=('x86_64')
url="https://github.com/quantonganh/jdtls-wrapper"
license=('MIT')
provides=("${_pkgcore}")
conflicts=("${_pkgcore}")
source=("https://github.com/quantonganh/jdtls-wrapper/releases/download/25.11.1/jdtls-wrapper_Linux_x86_64.tar.gz"
        "LICENSE::https://github.com/quantonganh/jdtls-wrapper/raw/refs/heads/main/LICENSE")
sha256sums=('bd7e39e1f508707149af254a0fd10a0c1dd0c0526fde192eef7c7ef0fb330290'
            '927eee75f06d3d8f4364426c184bbac5067cb2fc713d49a48bf476455219f5e9')

package() {
    install -Dm755 "$srcdir/${_pkgcore}" "$pkgdir/usr/bin/${_pkgcore}"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
