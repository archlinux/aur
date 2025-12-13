pkgname=llm-thalamus-doomguy
pkgver=1.0
pkgrel=2
pkgdesc="Doomguy theme for llm-thalamus"
arch=('any')
#depends=('llm-thalamus')
provides=('llm-thalamus-theme')
conflicts=('llm-thalamus-theme')
source=('https://github.com/evertvorster/llm-thalamus-doomguy/archive/refs/tags/v1.0.tar.gz')
sha256sums=('5229ed35366e8f2c2a4fa294ba3ee2c353af80ba3c51630c607ecd65a25d1b6a')

package() {

cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "llm_thalamus.svg" "$pkgdir/usr/share/llm-thalamus/graphics/llm_thalamus.svg"
  install -Dm644 "llm.jpg"          "$pkgdir/usr/share/llm-thalamus/graphics/llm.jpg"
  install -Dm644 "thalamus.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/thalamus.jpg"
  install -Dm644 "inactive.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/inactive.jpg"
}
