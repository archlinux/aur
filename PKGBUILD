# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.4.1
pkgrel=8
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.4.1::https://github.com/zebradil/rustotpony/releases/download/0.4.1/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('dcb96179a0748a96a44ab0e9b3da508825fe70acf457277d3aff5130335d9d35')
