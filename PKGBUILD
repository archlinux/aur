# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=jiffy-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="A terminal based, app launcher, basic calculator, emoji picker, color picker, and extendable with custom command palette, for Linux."
arch=('x86_64')
url="https://github.com/5hubham5ingh/jiffy"
license=('unknown')
source=("https://github.com/5hubham5ingh/jiffy/releases/download/v${pkgver}/jiffy-linux-86_64.tar.gz")
sha512sums=('5fd6ca22fac84f931232e7dabb7cbf6d499f4dbdd5694b5b0d46a76b4d0a4f9914866bb35c17fe7d2116dde9f0ff90d9679896cce685435ee1e19295e5fcd1a7')
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

