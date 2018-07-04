# Maintainer: Philip Sequeira <phsequei at gmail dot com>

pkgname=otf-exo
pkgver=2.0
pkgrel=7
pkgdesc='A geometric sans serif font with a technological feel'
arch=('any')
url='http://ndiscovered.com/'
license=('OFL')
depends=('fontconfig' 'xorg-mkfontdir')
source=('http://ndiscovered.com/archives/exo-2.zip')
md5sums=('64462f43a098c80e6f84f5ef21c431b2')
sha256sums=('6e5902c7eb57ad05a816464d43a404049d2e37c8add9c8d5eac121ddadcd7669')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "${srcdir}"/Exo2-*.otf
}
