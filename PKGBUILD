pkgname=shellcheck-static
pkgver=0.4.6
pkgrel=2
pkgdesc="shellcheck, without the 400MB haskell dependencies"
license=("AGPL3")
arch=("i686" "x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=0.4.6")

source=("https://storage.googleapis.com/shellcheck/shellcheck-v${pkgver}.linux.x86_64.tar.xz")
sha256sums=('fe0a6e94d9cf24b5a46553265846480425067f95f2630317f8fd99bc60a13719')

package() {
    cd "${srcdir}/shellcheck-v${pkgver}"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
