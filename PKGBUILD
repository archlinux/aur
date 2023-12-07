# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.4.4
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.4.4::https://github.com/zebradil/rustotpony/releases/download/0.4.4/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('32c7febccdc4950690a0c846732de63f7ee0d013501e2b7095eae83d05887cbe')
