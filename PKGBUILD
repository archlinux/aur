# Maintainer: Bart Janssens <bart at bartjanssens dot org>

pkgname=ttf-juliamono
_commit='3e9bd602b89ecd377f536007e8fdd75b80e01d60'
pkgver=0.021
pkgrel=1
pkgdesc='JuliaMono is a monospace typeface designed for programming in Julia.'
arch=('any')
url='https://juliamono.netlify.app/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
source=("JuliaMono-${pkgver}.tar.gz::https://github.com/cormullion/juliamono/releases/download/v${pkgver}/JuliaMono.tar.gz")
sha256sums=('f81f7494638c5f0a2b0cd72c4322e95bad8a1c77786c6280d836afcf3f04a474')

package() {
  cd "${srcdir}"
  tar xf JuliaMono-${pkgver}.tar.gz
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
