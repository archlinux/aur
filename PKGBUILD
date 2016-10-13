# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=prosody-mod-mam
pkgver=0.10.0
pkgrel=5
pkgdesc="XEP-0313: Message Archive Management"
arch=('any')
url="https://hg.prosody.im/prosody-modules/file/tip/mod_mam/"
license=('MIT')
#depends=('prosody')
source=(
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/fallback_archive.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mamprefs.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mamprefsxml.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mod_mam.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/rsm.lib.lua"
)

sha512sums=(SKIP
	    SKIP
            SKIP
            SKIP
            SKIP
            )

package() {
  install -Dm 644 "fallback_archive.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/fallback_archive.lib.lua"
  install -Dm 644 "mamprefs.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mamprefs.lib.lua"
  install -Dm 644 "mamprefsxml.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mamprefsxml.lib.lua"
  install -Dm 644 "mod_mam.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mod_mam.lua"
  install -Dm 644 "rsm.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/rsm.lib.lua"
}
