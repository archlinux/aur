# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=jiffy-bin
pkgver=1.6.1
pkgrel=3
pkgdesc="A terminal based, app launcher, basic calculator, emoji picker, color picker, and extendable with custom command palette, for Linux."
arch=('x86_64')
url="https://github.com/5hubham5ingh/jiffy"
license=('unknown')
source=("https://github.com/5hubham5ingh/jiffy/releases/download/v${pkgver}/jiffy-linux-86_64.tar.gz")
sha512sums=('8da4dd670d5a5190a2b1175a7226a87245b585e4eae25832fd94b7c1fd520cbe07094a15be271c3fa30de903c4d277a280c2969a94d6fb5d078effa65cdb7d1c')
conflicts=('jiffy')
depends=('bc' 'fzf')
optdepends=(
    'kitty: for displaying app icons'
)
options=(!debug)

package() {
    cd "${srcdir}"
    install -Dm755 jiffy "$pkgdir/usr/bin/jiffy"
}

