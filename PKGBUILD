# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D

pkgname=firefox-binnenibegone
pkgver=2.7
pkgrel=1
pkgdesc="remove so called Binnen-Is on webpages"
url=https://addons.mozilla.org/en-US/firefox/addon/binnen-i-be-gone/
arch=("any")
license=("GPL3")
source=("https://addons.cdn.mozilla.net/user-media/addons/6822/binnen_i_be_gone-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
b2sums=("aa381e199e702a2ee37339f19586abdbf047c28d77f728d3f38cbac457cb937da2b5c62c9e1c17b4a5f8c56009286e17abfde064106c599999f649df68df3171")
sha512sums=("ae736ca7a6ff166db082a64b5160d512ddecdc87014635a267f2001b3800f61fa4db46c0df83f7bd9b18dc10737658049b4c28c8c5cc869b1d2a690139c28f63")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{b65d7d9a-4ec0-4974-b07f-83e30f6e973f}.xpi
}

# vim:set ts=2 sw=2 et:
