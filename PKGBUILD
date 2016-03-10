# Maintainer: Polichronucci <nick AT discloud DOT eu>
pkgname=prosody-mod-auth-dovecot
pkgver=2014_03_28
pkgrel=1
pkgdesc="Prosody authentication plugin which uses Dovecot as the backend"
arch=('any')
url="https://modules.prosody.im/mod_auth_dovecot.html"
license=('MIT')
depends=('prosody')

source=("https://hg.prosody.im/prosody-modules/raw-file/cb74e4ab13f0/mod_auth_dovecot/auth_dovecot/mod_auth_dovecot.lua"
        "https://hg.prosody.im/prosody-modules/raw-file/cb74e4ab13f0/mod_auth_dovecot/auth_dovecot/sasl_dovecot.lib.lua")

md5sums=("d2314ee5fd6913d505fd5429244a1aa8"
         "14eb927b9c92801d7005c119a4acc079")

package() {
  install -Dm 644 "mod_auth_dovecot.lua" "${pkgdir}/usr/lib/prosody/modules/mod_auth_dovecot.lua"
  install -Dm 644 "sasl_dovecot.lib.lua" "${pkgdir}/usr/lib/prosody/modules/sasl_dovecot.lib.lua"
}
