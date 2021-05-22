# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=otf-mintspirit
_fontname=MintSpirit
pkgver=1.005
pkgrel=3
_date=20150322
pkgdesc="A sans-serif font"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:"OFL 1.1"')
groups=('otf-adf-fonts')
source=("http://arkandis.tuxfamily.org/fonts/${_fontname}-${_date}.zip")

sha256sums=('338f6e5f3660e393c534e214c2654f93aa1d83587e230f7d0186068612aef871')


build() {
  # nothing to do
  true
}

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF/
  install -Dm644 "${srcdir}/${_fontname}-${_date}"/OTF/*.otf "${pkgdir}"/usr/share/fonts/OTF/
  install -Dm644 "${srcdir}/${_fontname}-${_date}/OFL.txt" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
