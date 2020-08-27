# Maintainer: Bart Janssens <bart at bartjanssens dot org>

pkgname=ttf-juliamono
_commit='3e9bd602b89ecd377f536007e8fdd75b80e01d60'
pkgver=0.010
pkgrel=1
pkgdesc='JuliaMono is a monospace typeface designed for programming in Julia.'
arch=('any')
url='https://juliamono.netlify.app/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
source=("JuliaMono-${pkgver}.tar.gz::https://github.com/cormullion/juliamono/archive/v0.010.tar.gz")
sha256sums=('1fa4f87007e56d82d27d9546503007c3aaf6a91f8ee95c43ac732eb9ca44faae')

package() {
  cd "${srcdir}"
  tar xf JuliaMono-${pkgver}.tar.gz
  cd juliamono-${pkgver}
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
