# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=transformers_ocr
pkgver=0.5
pkgrel=1
pkgdesc="An OCR tool for manga using maim with Transformers."
arch=(any)
url="https://github.com/Ajatt-Tools/transformers_ocr"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'libnotify' 'python-pip' 'bash' 'maim' 'xclip')
sha256sums=('c8f1a3acd9a0284fe57a756332562e38028cbd91799a64cc8c96ed8394c88087')

package() {
	cd -- "${pkgname}-${pkgver}"
	PREFIX="${pkgdir}/usr" make install
}
