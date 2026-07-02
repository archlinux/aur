pkgname=llm-thalamus-hal9000
pkgver=1.0
pkgrel=1
pkgdesc="HAL 9000 theme for llm-thalamus"
arch=('any')
provides=('llm-thalamus-theme')
conflicts=('llm-thalamus-theme')
source=('https://github.com/evertvorster/llm-thalamus-hal9000/archive/refs/tags/v1.0.tar.gz')
sha256sums=('6ebb75e5300437982fc77d10b945e0be9252ebdc43d62ebded137214f658df90')

package() {

cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "llm_thalamus.svg" "$pkgdir/usr/share/llm-thalamus/graphics/llm_thalamus.svg"
  install -Dm644 "llm.jpg"          "$pkgdir/usr/share/llm-thalamus/graphics/llm.jpg"
  install -Dm644 "thalamus.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/thalamus.jpg"
  install -Dm644 "inactive.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/inactive.jpg"
}
