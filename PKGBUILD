# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=lustache-cli
pkgver=1.0.0
pkgrel=3
pkgdesc="A command-line interface to lustache (mustache templates for lua)."
arch=("any")
url="https://github.com/djmattyg007/lustache-cli"
license=("UNLICENSE")
depends=("lua" "lua-argparse" "lua-luajson" "lustache")
source=("https://github.com/djmattyg007/lustache-cli/archive/${pkgver}.tar.gz")
sha256sums=('90f5790403b269eb37a2258d330572eab9f3036e31e858abdbb7fb02ec584d1a')

package() {
    cd "lustache-cli-${pkgver}"
    install -Dm755 "lustache-cli" "${pkgdir}/usr/bin/lustache-cli"
}

