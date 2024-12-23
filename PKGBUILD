# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.5.5
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
install=''
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.5.5::https://github.com/zebradil/rustotpony/releases/download/0.5.5/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('82b478d1d9f2fe5250f4f48f6ac5aeb480131303e8b1e0e2a6ebb7cad3811601')
