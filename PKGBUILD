# maintainer: fordprefect: <fordprefect@dukun.de>
pkgname=prosody-mod-smacks
pkgver=2020.04.06
pkgrel=1
_commit="bf5d91769f99"
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://modules.prosody.im/mod_smacks.html"
license=('MIT')
depends=('prosody' 'lua52-dbi')
source=("mod_smacks_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_smacks/mod_smacks.lua")
sha1sums=('8e440d13ed974ee110b702cd59d59b81e0361780')

package() {
  install -Dm 644 "mod_smacks_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
