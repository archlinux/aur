# maintainer: fordprefect: <fordprefect@dukun.de>
pkgname=prosody-mod-smacks
pkgver=2019.08.11
pkgrel=1
_commit="58047d6f2b89"
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://modules.prosody.im/mod_smacks.html"
license=('MIT')
depends=('prosody' 'lua52-dbi')
source=("mod_smacks_$_commit.lua::https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_smacks/mod_smacks.lua")
sha1sums=('0a6df04e8ec1b430ca93b9a8a31614f3ad727177')

package() {
  install -Dm 644 "mod_smacks_$_commit.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
