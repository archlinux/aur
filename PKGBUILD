pkgname=llm-thalamus-anime
pkgver=1.0
pkgrel=1
pkgdesc="Anime theme for llm-thalamus"
arch=('any')
#depends=('llm-thalamus')
provides=('llm-thalamus-theme')
conflicts=('llm-thalamus-theme')
source=('https://github.com/evertvorster/llm-thalamus-anime/archive/refs/tags/v1.0.tar.gz')
sha256sums=('38361902c07e29905d58dc70788c177b6d005670767a5e19294e8670eee4b75f')

package() {

cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "llm_thalamus.svg" "$pkgdir/usr/share/llm-thalamus/graphics/llm_thalamus.svg"
  install -Dm644 "llm.jpg"          "$pkgdir/usr/share/llm-thalamus/graphics/llm.jpg"
  install -Dm644 "thalamus.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/thalamus.jpg"
  install -Dm644 "inactive.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/inactive.jpg"
}
