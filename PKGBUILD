pkgname=firefox-extension-adnauseam-bin-amo
pkgver=3.27.0
pkgrel=1
pkgdesc="This package contains latest version of AdNauseam from addon.mozilla.org (AMO). AdNauseam is a lightweight browser extension that blends software tool and artware intervention to actively fight back against tracking by advertising networks."
arch=('any')
url="https://adnauseam.io/"
license=('GPL-3.0-only')
optdepends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/4634365/adnauseam-${pkgver}.xpi")
sha256sums=('629000b5412f7f18c2380444ff8d4bfcf6dc96be0dfa95d7b8da233fd5aa9948')
_extid='adnauseam@rednoise.org'

package() {
  install -Dm644 "${srcdir}/adnauseam-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/${_extid}.xpi"
}

