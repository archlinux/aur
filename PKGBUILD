# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.5.4
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
install=''
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.5.4::https://github.com/zebradil/rustotpony/releases/download/0.5.4/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('af1987b6363d261198c832ce5d57c2f1240a33e821cb7831000c4be3beeb0ae1')
