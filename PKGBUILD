# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc9f
pkgrel=1
pkgdesc='A professional screenwriting software.'
url='https://kitscenarist.ru/en/'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=()
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('9186a8a292b1dec73566e9b8bdca40168ed74484b7d440992512b2644820390d2ffb6d8705f0dddd4ef7167911020b9b1fb4d55b62984b5348633c604c4af3da')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod go-w -R "${pkgdir}"
}
