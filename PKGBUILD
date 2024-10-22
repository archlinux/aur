# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=rustotpony-bin
pkgver=0.5.3
pkgrel=2
pkgdesc='RusTOTPony — CLI manager of one-time password generators like Google Authenticator'
url='https://github.com/zebradil/rustotpony'
arch=(x86_64)
license=(MIT)
install=''
conflicts=(rustotpony)
provides=(totp)
source=(rustotpony-bin-0.5.3::https://github.com/zebradil/rustotpony/releases/download/0.5.3/totp-linux)
package () 
{ 
    set -eo pipefail;
    _binname=totp;
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
}
sha256sums=('1998bdbc57a55bb8ed7a2300e74a5068e62f5529d12f75f5d9aaa53c1675cccd')
