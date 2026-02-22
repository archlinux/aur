# Maintainer: CosmicPredator <cosmicpredator@proton.me>
pkgname=chibi-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Chibi for AniList - A lightweight anime & manga tracker CLI app powered by AniList."
arch=('x86_64')
url="https://chibi-cli.pages.dev/"
license=('GPL3')
source=(
    "https://github.com/CosmicPredator/chibi-cli/releases/download/${pkgver}/chibi_${pkgver}_amd64.deb"
)
sha256sums=(
    '5e7d7383774a0a8ab72b4d20ac522e4303c9a55f8aa3f97489f0a8f4fd55bfe3'
)

package() {
    bsdtar -xf "$srcdir/chibi_${pkgver}_amd64.deb"
    bsdtar -xf data.tar.*
    
    install -Dm755 usr/local/bin/chibi "$pkgdir/usr/bin/chibi"
}
