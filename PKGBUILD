# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.4.5
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
install=''
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.4.5::https://github.com/zebradil/rustotpony/releases/download/0.4.5/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('66f6599ceb8d61b4763b64e741819bb3bc72a9418556efd8dc33e7227c046dfa')
