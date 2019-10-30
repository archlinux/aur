# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc9e
pkgrel=1
pkgdesc='A professional screenwriting software.'
url='https://kitscenarist.ru/en/'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=()
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('836eb22b2459f6f00d9b9dd45c6b6039156f8757aad2335bcd07e2acb360599617a00ef73334809fb3cb90f3a67bacbe373ee84ff21fd4f9ec24e78968cfc212')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod go-w -R "${pkgdir}"
}
