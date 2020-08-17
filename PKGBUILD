# Maintainer: Bart Janssens <bart at bartjanssens dot org>

pkgname=ttf-juliamono
_commit='3e9bd602b89ecd377f536007e8fdd75b80e01d60'
pkgver=0.008
pkgrel=1
pkgdesc='JuliaMono is a monospace typeface designed for programming in Julia.'
arch=('any')
url='https://juliamono.netlify.app/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
source=("JuliaMono-${pkgver}.tar.gz::https://github.com/cormullion/juliamono/releases/download/v0.008/JuliaMono.tar.gz")
sha256sums=('7d95c8f32ede416c332f35ccd21f67b880b50a3feac387ebddf0f7935a78ff69')

package() {
  cd "${srcdir}"
  tar xf JuliaMono-${pkgver}.tar.gz
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
