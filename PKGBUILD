# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc8
pkgrel=1
pkgdesc='A professional screenwriting software.'
url='https://kitscenarist.ru/en/'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=()
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('59d98bbcc489831f8c8beaabf178fdc6f7d0580809cd9e283e35c55e8e42c68dc3f521ee698a4bdd628533f9597945602c21a093b15a2fad9d3a4d02146218d5')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod go-w -R "${pkgdir}"
}
