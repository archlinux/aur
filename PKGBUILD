# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=otf-mintspirit
pkgver=1.005
pkgrel=1
pkgdesc="A font designed by Hirwen Harendal and released by Arkandis Digital Foundry"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:"OFL 1.1"')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=otf.install
source=("http://arkandis.tuxfamily.org/fonts/MintSpirit-20150322.zip")

md5sums=('0907e79f4d9389f92e3862fbe3b95a57')


build() {
  # nothing to do
  true
}

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF/
  install -Dm644 "${srcdir}"/*/[Oo][Tt][Ff]/*.[Oo][Tt][Ff] "${pkgdir}"/usr/share/fonts/OTF/
  install -Dm644 "${srcdir}"/*/OFL.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
