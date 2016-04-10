# maintainer: fordprefect: <fordprefect@dukun.de>
pkgname=prosody-mod-smacks
pkgver=2016.03.27
pkgrel=2
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://modules.prosody.im/mod_smacks.html"
license=('MIT')
depends=('prosody')
source=("https://hg.prosody.im/prosody-modules/raw-file/3a94b3cd31e2/mod_smacks/mod_smacks.lua")
sha1sums=('c29bea4125ec0a5a77155653f6f6b446ab9543e0')

package() {
  install -Dm 644 "mod_smacks.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
