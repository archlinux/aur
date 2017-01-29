# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Nils B. <aur@theinbox.de>

_pkggroup='keepass-plugin'
_pkgname='otpkeyprov'
pkgname="${_pkggroup}-${_pkgname}"
pkgver='2.5'
pkgrel=1
pkgdesc="A plugin that allows to use the YubiKey OTP functionality in Keepass."
arch=('i686' 'x86_64')
url="http://keepass.info/plugins.html#${_pkgname}"
license=('GPL2')
depends=('keepass>=2.35')
optdepends=('yubikey-personalization: For configuring a YubiKey')
source=("http://keepass.info/extensions/v2/${_pkgname}/OtpKeyProv-${pkgver}.zip")
sha512sums=('7e0a470f2bc32b4b6f68a6eab90b01a42a85a309f1d0208c205011a0e1a8779c0953ac36b144e0d4245d3820201fc0dd00f698abf28ba7034ae847550e25001f')

package() {
  cd "${srcdir}"
  install -Dm 644 'OtpKeyProv.plgx' "${pkgdir}/usr/share/keepass/plugins/OtpKeyProv.plgx"
}

# vim:set et sw=2 sts=2 tw=80:
