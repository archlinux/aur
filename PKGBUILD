# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.4.3
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.4.3::https://github.com/zebradil/rustotpony/releases/download/0.4.3/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('88e792f4782ff72d29f12fce7bfa1208becca7eb5570ac8f2f68aa5819452c08')
