pkgname=llm-thalamus-anime
pkgver=1.1
pkgrel=1
pkgdesc="Anime theme for llm-thalamus"
arch=('any')
depends=('python')
provides=('llm-thalamus-theme')
conflicts=('llm-thalamus-theme')
source=('https://github.com/evertvorster/llm-thalamus-anime/archive/refs/tags/v1.1.tar.gz')
sha256sums=('fa47dd83a4a20d96d9723feac9905f572eed860144b752e5222a5d09efbcaba2')

package() {

cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "llm_thalamus.svg" "$pkgdir/usr/share/llm-thalamus/graphics/llm_thalamus.svg"
  install -Dm644 "llm.jpg"          "$pkgdir/usr/share/llm-thalamus/graphics/llm.jpg"
  install -Dm644 "thalamus.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/thalamus.jpg"
  install -Dm644 "inactive.jpg"     "$pkgdir/usr/share/llm-thalamus/graphics/inactive.jpg"
}
