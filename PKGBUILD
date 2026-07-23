# Maintainer: Bart Janssens <bart at bartjanssens dot org>

pkgname=ttf-juliamono
pkgver=0.63.2
pkgrel=1
pkgdesc='JuliaMono is a monospace typeface designed for programming in Julia.'
arch=('any')
url='https://juliamono.netlify.app/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
source=("JuliaMono-${pkgver}.tar.gz::https://github.com/cormullion/juliamono/releases/download/v${pkgver}/JuliaMono.tar.gz")
sha256sums=('ef2b1c589bfe9703f89666f3a17d9a647e37672c33d25921a419fabd3d8c498e')

package() {
  cd "${srcdir}"
  tar xf JuliaMono-${pkgver}.tar.gz
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
