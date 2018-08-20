# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>

pkgname=firefox-extension-privacy-pass
pkgver=1.0
pkgrel=1
pkgdesc='Handle passes containing cryptographically blinded tokens for bypassing challenge pages.'
url=https://github.com/privacypass/challenge-bypass-extension
arch=('any')
license=('BSD')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/758380/cloudflare_privacy_pass-$pkgver-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('f5791179a4a1d4435431de3627df88a0e544444ccf3d434bd3d645bf87141ff2')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/privacy-pass.xpi
}

# vim:set ts=2 sw=2 et:
