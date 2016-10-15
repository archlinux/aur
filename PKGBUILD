# Maintainer: Ron. A <archlinux.org at 0xadada.pub>
pkgname=ttf-twitter-color-emoji-svginot
pkgver=1.1
pkgrel=2
pkgdesc="A color emoji font using Twitter Emoji for Everyone SVG graphics"
arch=('any')
license=('MIT')
url="https://github.com/eosrei/twemoji-color-font"
depends=('fontconfig')
source=("https://github.com/eosrei/twemoji-color-font/releases/download/v${pkgver}/TwitterColorEmoji-SVGinOT-${pkgver}.zip")
sha256sums=('59ce24afb398820bd505430898316f18498a2d670bd82f05594b5cf21a790f6e')

function pkgver {
    printf "%s" "${pkgver}"
}

function package {
    install -Dm644 "TwitterColorEmoji-SVGinOT-1.1/TwitterColorEmoji-SVGinOT.ttf" \
        "${pkgdir}/usr/share/fonts/${pkgname}/TwitterColorEmoji-SVGinOT.ttf"
}
