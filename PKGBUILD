# maintainer: fordprefect: <fordprefect@dukun.de>
pkgname=prosody-mod-smacks
pkgver=2017.08.27
pkgrel=1
_commit="dbba101601b4"
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://modules.prosody.im/mod_smacks.html"
license=('MIT')
depends=('prosody')
source=("mod_smacks_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_smacks/mod_smacks.lua")
sha1sums=('75a4ab9f91014ce3db9c411c0528c963595e3783')

package() {
  install -Dm 644 "mod_smacks_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
