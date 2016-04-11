# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=prosody-mod-mam
pkgver=0.10.0
pkgrel=3
pkgdesc="XEP-0313: Message Archive Management"
arch=('any')
url="https://hg.prosody.im/prosody-modules/file/tip/mod_mam/"
license=('MIT')
depends=('prosody')
source=(
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/fallback_archive.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mamprefs.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mamprefsxml.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mod_mam.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/rsm.lib.lua"
)

sha512sums=('9a49d463886403d46f973d0a0c708e9876a1f0baa699a7b48fb6d25e70c8d0b4f04b2902759eac3c2277b2c8c7af68997187cc500b93f69a288bbaa2ced45f23'
            '9c4b992c1f1ce66b9d6c900a2637ccf16ac5b59e3c3c93e578bdc8f78b1790fb3a87dce4b1eafe5132b495a6aa28f4f945926a030722d39b048824352d11b3bf'
            'ed2da5219d46e93681e5e3d41086a7bb70a868850d961656e12c31aa0a73566ab83cfdf9eeac0e40d7f93c63157c850855cbbc43ec879e41b2a3b542d9e2cc7a'
            '0353f2c17807a8878cafee8376c17ef06a4aebdd9f775660bcaf57c6304fbb1cd40d6ed7ac708232675312d37f6bebbebc781bc62fb333b16a573363391ad66b'
            '1a27cd5b8f54e11213b31a22c90ded6226223b26ab6e2a5534df532c8d2d9ca4a082e31e59c8dc0d64ed9368e075a54defb98a672f4a58582d5ae259d6119dfd')

package() {
  install -Dm 644 "fallback_archive.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/fallback_archive.lib.lua"
  install -Dm 644 "mamprefs.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mamprefs.lib.lua"
  install -Dm 644 "mamprefsxml.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mamprefsxml.lib.lua"
  install -Dm 644 "mod_mam.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mod_mam.lua"
  install -Dm 644 "rsm.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/rsm.lib.lua"
}
