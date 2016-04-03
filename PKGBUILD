# Maintainer: Ron. A <archlinux.org at 0xadada.pub>
pkgname=ttf-twitter-color-emoji-svginot
pkgver=1.0
pkgrel=1
pkgdesc="A color emoji font using Twitter Emoji for Everyone SVG graphics"
arch=('any')
license=('MIT')
url="https://github.com/eosrei/twemoji-color-font"
depends=('fontconfig')
source=("https://github.com/eosrei/twemoji-color-font/releases/download/v${pkgver}-alpha/TwitterColorEmoji-SVGinOT-${pkgver}-alpha.zip")
sha256sums=('341e2d5ef6eed9c506f6010048e12f646f9d0ccce8e82676eaebf1ef06eb4ca3')

function pkgver {
    printf "%s" "${pkgver}"
}

function package {
    install -Dm644 "TwitterColorEmoji-SVGinOT.ttf" \
    "${pkgdir}/usr/share/fonts/${pkgname}/TwitterColorEmoji-SVGinOT.ttf"
}


