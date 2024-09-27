# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.5.2
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
install=''
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.5.2::https://github.com/zebradil/rustotpony/releases/download/0.5.2/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('51ad3f9f81435de4931bd2da7554c400609e6114e236195a99ce58eeb7caf2cd')
