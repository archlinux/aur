# Maintainer: Polichronucci <nick AT discloud DOT eu>

pkgname=prosody-mod-auth-dovecot
pkgver=20180104
_pkgver=afeb06e4cdea
pkgrel=1
pkgdesc='Prosody authentication plugin which uses Dovecot as the backend'
arch=('any')
url='https://modules.prosody.im/mod_auth_dovecot.html'
license=('MIT')
depends=('prosody' 'dovecot')

source=("https://hg.prosody.im/prosody-modules/raw-file/${_pkgver}/mod_auth_dovecot/auth_dovecot/mod_auth_dovecot.lua"
        "https://hg.prosody.im/prosody-modules/raw-file/${_pkgver}/mod_auth_dovecot/auth_dovecot/sasl_dovecot.lib.lua")

sha512sums=('bbb0fc70881f2f2d8ff5672e475e4d00ee0272580cfe93a6f14a01d465efc8ec671ecb125e399c430da97e253ca1ba718e7384ba783d1840c50dc914ae6f57b6'
            'e779a58fd5ab5196645010ee53537e448cb1629fe7153bd55b84ad96f965111eb5e31369e6f66a9fe77d14d6578de84658ef09edc1541955a7ed369bf2885567')

package() {
  install -Dm 644 'mod_auth_dovecot.lua' "${pkgdir}/usr/lib/prosody/modules/mod_auth_dovecot.lua"
  install -Dm 644 'sasl_dovecot.lib.lua' "${pkgdir}/usr/lib/prosody/modules/sasl_dovecot.lib.lua"
}
