# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=firefox-extension-privacy-pass
pkgver=2.0.6
pkgrel=1
pkgdesc='Handle passes containing cryptographically blinded tokens for bypassing challenge pages.'
url=https://github.com/privacypass/challenge-bypass-extension
arch=('any')
license=('BSD')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/3556492/privacy_pass-$pkgver-fx.xpi")
noextract=("${source##*/}")
sha512sums=('6cab6d4951febd0629231416d1553f14eb8ed6141450f0cb1461dd408945d7a4c242856eabb48bf3fad7d896e759b17ae3db879d1d4a151c0e66a90aec89d8f7')

package() {
  install -Dm755 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/privacy-pass.xpi
}

# vim:set ts=2 sw=2 et:
