# Maintainer: Nils B. <aur@theinbox.de>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=keepass-plugin-keechallenge
pkgver=1.4.0
pkgrel=2
pkgdesc="A plugin that allows to use the yubikey HMAC-SHA1 challenge-response functionality in Keepass."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/keechallenge/"
license=('GPL2')
depends=('keepass')
optdepends=('yubikey-personalization: For configuring a YubiKey')
_zipname="KeeChallenge_1.4_win"
source=(http://sourceforge.net/projects/keechallenge/files/KeeChallenge/bin/${_zipname}.zip)

build() {
  cd ${srcdir}

}

package() {
  cd ${srcdir}
  install -D -m 644 KeeChallenge.dll.config ${pkgdir}/usr/share/keepass/plugins/KeeChallenge.dll.config
  install -D -m 644 KeeChallenge.dll ${pkgdir}/usr/share/keepass/plugins/KeeChallenge.dll
}

md5sums=('7c2f5d8ccbe9549767ca15de0fbf7383')
sha512sums=('a6d329b29e1bb71e6a4e73fa4f65476749bbd2b02ce9350f51f2b396ee76d231614a6149ce2705ca7bea8aa6ff7ca921b58d8995e258eb1eb5be9ae9a38ca285')
