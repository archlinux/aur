# maintainer: fordprefect: <fordprefect@dukun.de>
pkgname=prosody-mod-smacks
pkgver=2017.03.15
pkgrel=1
_commit="c110b6bfe5d1"
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://modules.prosody.im/mod_smacks.html"
license=('MIT')
depends=('prosody')
source=("mod_smacks_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_smacks/mod_smacks.lua")
sha1sums=('0fe74d5f8da25d9560781ce1b85580c83a5ff105')

package() {
  install -Dm 644 "mod_smacks_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
