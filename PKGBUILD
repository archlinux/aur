pkgname=shellcheck-static
pkgver=0.4.6
pkgrel=1
pkgdesc="shellcheck, without the 400MB haskell dependencies"
license=("AGPL3")
arch=("i686" "x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=0.4.6")

source=("https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz")
sha256sums=('c0c39dac36714058f8b6e1a874255f556dfd66870e0c82791acff3b223a06e4e')

package() {
    install -Dt "${pkgdir}/usr/bin" "${srcdir}/shellcheck-latest/shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "${srcdir}/shellcheck-latest/LICENSE.txt" "${srcdir}/shellcheck-latest/README.txt"
}
