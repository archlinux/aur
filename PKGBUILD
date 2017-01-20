# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=prosody-mod-support-contact
pkgver=2017.01.20
pkgrel=1
_commit="51cf82d36a8a"
pkgdesc="Prosody plugin adds a default contact to newly registered accounts"
arch=('any')
url="https://modules.prosody.im/mod_support_contact.html"
license=('MIT')
depends=('prosody')
source=("mod_support_contact_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_support_contact/mod_support_contact.lua")
sha256sums=('164928fe42a8ecae92c7f61888f52dd11b8d146f1abed9f10f81335594439cf7')

package() {
  install -Dm 644 "mod_support_contact_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_support_contact.lua"
}
