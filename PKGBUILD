# Maintainer: Can Ozokur <canozokur[at]gmail[dot]com>
pkgname=beyond-identity-bin
_pkgname=beyond-identity
pkgver=2.62.0_0
_pkgver=2.62.0-0
pkgrel=1
pkgdesc="Beyond Identity Linux authenticator (official binary)"
arch=('x86_64')
url="https://app.byndid.com/downloads"
license=('custom: commercial')
depends=('gnome-keyring'
  'tpm2-tss'
  'openssl')
optdepends=('tpm2-abrmd'
  'tpm2-tools'
  'zenity: Receive desktop notifications')
backup=('etc/xdg/autostart/com.beyondidentity.endpoint.pgpauth.autostart.BeyondIdentity.desktop'
  'etc/xdg/autostart/com.beyondidentity.endpoint.webserver.autostart.BeyondIdentity.desktop')
provides=('beyond-identity')
conflicts=('beyond-identity')
install="${pkgname}.install"
source=("https://packages.beyondidentity.com/public/linux-authenticator/raw/versions/${_pkgver}/${_pkgname}-${_pkgver}.${CARCH}.tar.gz")
sha512sums=('383163e793e8b80b23b644e23f422ee9c67fec429ef4a6440faf1601bdf6bbdebde7f179f82bc635fb04be5890c8c1c8cbdd294c26b1e65d4a96ec4899b60666')

package() {
  cp -R "${srcdir}/"* "${pkgdir}"
}
