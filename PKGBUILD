# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>

declare srcdir pkgdir
pkgname=ttf-pragmasevka
pkgver=1.7.0
pkgrel=2
pkgdesc="Pragmata Pro doppelgänger made of Iosevka SS08"
arch=(any)
url="https://github.com/shytikov/pragmasevka"
license=('GPL')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/shytikov/pragmasevka/releases/download/v${pkgver}/Pragmasevka.zip"
    "LICENSE::https://raw.githubusercontent.com/shytikov/pragmasevka/refs/tags/v${pkgver}/LICENSE.md")
md5sums=('24a907a51f01b85afa861a50d481aae7'
    'da37ff157518269aea972868cebfbc54')

package() {
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" "pragmasevka-bold.ttf"
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" "pragmasevka-bolditalic.ttf"
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" "pragmasevka-italic.ttf"
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" "pragmasevka-regular.ttf"
    install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=4 sw=4 et:
