# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D

pkgname=firefox-binnenibegone
pkgver=3.1.1
pkgrel=1
pkgdesc="remove so called Binnen-Is on webpages"
url=https://addons.mozilla.org/en-US/firefox/addon/binnen-i-be-gone/
arch=("any")
license=("GPL-3.0-only")
source=("https://addons.mozilla.org/firefox/downloads/file/3862807/binnen_i_be_gone-$pkgver.xpi")
noextract=("${source##*/}")
sha512sums=('02c46c5c0a33f5694a0129c96dec63a993c93fe285203f16c537a21b82c5ef24de5b731f10c2bc3fdcef893d86f3c059b9d577b32b31c84b22ab3579c93c9b06')
b2sums=('6347656ad4772a83e9e3c408d12375db78cd90615198af4265ab4980d752f4c53d30b7e0c46f7be6363158a64198d201462839771224ff6f99d29bb664620ecb')

package() {
    install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/{b65d7d9a-4ec0-4974-b07f-83e30f6e973f}.xpi
}

# vim:set ts=2 sw=2 et:
