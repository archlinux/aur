# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Nils B. <aur@theinbox.de>

_pkggroup='keepass-plugin'
_pkgname='otpkeyprov'
pkgname="${_pkggroup}-${_pkgname}"
pkgver='2.4'
pkgrel=1
pkgdesc="A plugin that allows to use the YubiKey OTP functionality in Keepass."
arch=('i686' 'x86_64')
url="http://keepass.info/plugins.html#${_pkgname}"
license=('GPL2')
depends=('keepass')
optdepends=('yubikey-personalization: For configuring a YubiKey')
source=("http://keepass.info/extensions/v2/${_pkgname}/OtpKeyProv-${pkgver}.zip")
sha512sums=('a63721e5d2ae81786d4e64d316799d066459a53e911fc71558f354aaa67d8199ef2cca1172bfdff86aedfab895ce872e0a06cef4eb2e34ecec69ebaf5639cf86')

package() {
  cd "${srcdir}"
  install -Dm 644 'OtpKeyProv.plgx' "${pkgdir}/usr/share/keepass/plugins/OtpKeyProv.plgx"
}

# vim:set et sw=2 sts=2 tw=80: