pkgname=llm-thalamus-brain
pkgver=1.0
pkgrel=1
pkgdesc="Brain theme for llm-thalamus"
arch=('any')
#depends=('llm-thalamus')
provides=('llm-thalamus-theme')
conflicts=('llm-thalamus-theme')
source=('https://github.com/evertvorster/llm-thalamus-brain/archive/refs/tags/v1.0.tar.gz')
sha256sums=('cc99c3fae719e62a14fd692b87f65b151bab569ae36e1f0d0ae66092e469b608')

package() {

cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "llm_thalamus.svg" "$pkgdir/usr/share/llm-thalamus/graphics/llm_thalamus.svg"
  install -Dm644 "llm.jpg"          "$pkgdir/usr/share/llm-thalamus/graphics/llm.jpg"
  install -Dm644 "thalamus.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/thalamus.jpg"
  install -Dm644 "inactive.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/inactive.jpg"
}
