# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=otf-mintspirit
pkgver=1.005
pkgrel=2
pkgdesc="A font designed by Hirwen Harendal and released by Arkandis Digital Foundry"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:"OFL 1.1"')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=otf.install
source=("http://arkandis.tuxfamily.org/fonts/MintSpirit-20150322.zip")

sha256sums=('338f6e5f3660e393c534e214c2654f93aa1d83587e230f7d0186068612aef871')


build() {
  # nothing to do
  true
}

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF/
  install -Dm644 "${srcdir}"/*/[Oo][Tt][Ff]/*.[Oo][Tt][Ff] "${pkgdir}"/usr/share/fonts/OTF/
  install -Dm644 "${srcdir}"/*/OFL.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
