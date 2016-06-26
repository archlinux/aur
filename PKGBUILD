# Maintainer: Nils Bars <arch@nbars.de>

pkgname=keepass-plugin-keechallenge
pkgver=1.5.0
pkgrel=1
pkgdesc="A plugin that allows to use the yubikey HMAC-SHA1 challenge-response functionality in Keepass."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/keechallenge/"
license=('GPL2')
depends=('keepass' 'yubikey-personalization')
_zipname="KeeChallenge_1.5"
source=(http://sourceforge.net/projects/keechallenge/files/KeeChallenge/bin/${_zipname}.zip)

build() {
  cd ${srcdir}

}

package() {
  cd "${srcdir}/${_zipname}"
  install -D -m 644 KeeChallenge.dll.config ${pkgdir}/usr/share/keepass/Plugins/KeeChallenge.dll.config
  install -D -m 644 KeeChallenge.dll ${pkgdir}/usr/share/keepass/Plugins/KeeChallenge.dll
}

md5sums=('80a7eada1c86332b3f91b75e4e8317f0')
sha512sums=('2ac8c81482c9f6f22963e2555f6b9d0b762c99c6348e0aa4e734462d5c011ba56fb529a7aa5f702a1790e57e50cdfa6fcd7c04f488703ab5d682e77db85bdc48')

