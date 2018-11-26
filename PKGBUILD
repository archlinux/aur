# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Nils B. <aur@theinbox.de>

_pkggroup='keepass-plugin'
_pkgname='otpkeyprov'
pkgname="${_pkggroup}-${_pkgname}"
pkgver='2.6'
pkgrel=1
pkgdesc="A plugin that allows to use the YubiKey OTP functionality in Keepass."
arch=('i686' 'x86_64')
url="http://keepass.info/plugins.html#${_pkgname}"
license=('GPL2')
depends=('keepass>=2.35')
optdepends=('yubikey-personalization: For configuring a YubiKey')
source=("http://keepass.info/extensions/v2/${_pkgname}/OtpKeyProv-${pkgver}.zip")
sha512sums=('0eace308bf07e2da3ac5c3d26ce13acd840b2a8a82fd55c74f9956881fc62bb7424e2ce847ffd5e0cd44e3be2f35bf6fe276cc546fbd19734aeb56b1f8f89b24')

package() {
  cd "${srcdir}"
  install -Dm 644 'OtpKeyProv.plgx' "${pkgdir}/usr/share/keepass/plugins/OtpKeyProv.plgx"
}

# vim:set et sw=2 sts=2 tw=80:
