# Maintainer: Polichronucci <nick AT discloud DOT eu>

pkgname=prosody-mod-auth-dovecot
pkgver=20140328
_pkgver=cb74e4ab13f0
pkgrel=2
pkgdesc='Prosody authentication plugin which uses Dovecot as the backend'
arch=('any')
url='https://modules.prosody.im/mod_auth_dovecot.html'
license=('MIT')
depends=('prosody')

source=("https://hg.prosody.im/prosody-modules/raw-file/${_pkgver}/mod_auth_dovecot/auth_dovecot/mod_auth_dovecot.lua"
        "https://hg.prosody.im/prosody-modules/raw-file/${_pkgver}/mod_auth_dovecot/auth_dovecot/sasl_dovecot.lib.lua")

sha512sums=('bbb0fc70881f2f2d8ff5672e475e4d00ee0272580cfe93a6f14a01d465efc8ec671ecb125e399c430da97e253ca1ba718e7384ba783d1840c50dc914ae6f57b6'
            '53efab70e01d204ad3c740093958e89ab6a4c5ffa8ba903ffe3976289b8ffdf2c44b18f9843d3fbbd095a29cd03743762c909d6c89322dae2d113395afa0e018')

package() {
  install -Dm 644 'mod_auth_dovecot.lua' "${pkgdir}/usr/lib/prosody/modules/mod_auth_dovecot.lua"
  install -Dm 644 'sasl_dovecot.lib.lua' "${pkgdir}/usr/lib/prosody/modules/sasl_dovecot.lib.lua"
}
