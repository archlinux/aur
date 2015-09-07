# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
pkgname=prosody-mod-vjud
pkgver=0.9.8
pkgrel=1
pkgdesc="XEP-0055: Jabber Search"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_vjud"
license=('MIT')
depends=('prosody')
source=(
    "http://hg.prosody.im/prosody-modules/raw-file/tip/mod_vjud/mod_vjud.lua"
    "http://hg.prosody.im/prosody-modules/raw-file/tip/mod_vjud/vcard.lib.lua"
)
sha1sums=('fafe8fe8f5b83b6b3af04ed55935be2b3923c681'
          'ca404b878624253f2b38a0841e03064be399dd50')

package() {
  install -Dm 644 "mod_vjud.lua" "${pkgdir}/usr/lib/prosody/modules/mod_vjud.lua"
  install -Dm 644 "vcard.lib.lua" "${pkgdir}/usr/lib/prosody/modules/vcard.lib.lua"
}
