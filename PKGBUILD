# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D

pkgname=firefox-binnenibegone
pkgver=2.8
pkgrel=1
pkgdesc="remove so called Binnen-Is on webpages"
url=https://addons.mozilla.org/en-US/firefox/addon/binnen-i-be-gone/
arch=("any")
license=("GPL3")
source=("https://addons.cdn.mozilla.net/user-media/addons/6822/binnen_i_be_gone-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
b2sums=("3c589b31eacad6ee6c0b3f6cad3502bce56a23921601bca75f7bc219b2a58aff599a8ed74a57c2d4f94d8beb2fb34d1a54682fa88f0f8172552123a83e5394eb")
sha512sums=("659292fd14029cae55de9722e23d2c7c9d5180f269824d8d9a4f56a8a9ee6a075acdb7eeca5338c952b643447091de3378d11bd60458f3cc71db495c13906155")

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{b65d7d9a-4ec0-4974-b07f-83e30f6e973f}.xpi
}

# vim:set ts=2 sw=2 et:
