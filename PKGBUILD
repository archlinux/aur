# Maintainer: Bart Janssens <bart at bartjanssens dot org>

pkgname=ttf-juliamono
pkgver=0.055
pkgrel=1
pkgdesc='JuliaMono is a monospace typeface designed for programming in Julia.'
arch=('any')
url='https://juliamono.netlify.app/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
source=("JuliaMono-${pkgver}.tar.gz::https://github.com/cormullion/juliamono/releases/download/v${pkgver}/JuliaMono.tar.gz")
sha256sums=('027654737001a1f85cc1689faa3676fb42a06d5bf5aa6e83ff77eb1edb3a3602')

package() {
  cd "${srcdir}"
  tar xf JuliaMono-${pkgver}.tar.gz
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
