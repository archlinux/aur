# maintainer: fordprefect: <fordprefect@dukun.de>
pkgname=prosody-mod-smacks
pkgver=2018.03.17
pkgrel=1
_commit="e672d1050529"
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://modules.prosody.im/mod_smacks.html"
license=('MIT')
depends=('prosody')
source=("mod_smacks_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_smacks/mod_smacks.lua")
sha1sums=('e72a475d8e2f5c526264c244d0404b9d1ddda3a1')

package() {
  install -Dm 644 "mod_smacks_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
