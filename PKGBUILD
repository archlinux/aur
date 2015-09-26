# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ttf-sil-abyssinica
pkgver=1.500
pkgrel=1
pkgdesc="OpenType calligraphic font for Ethiopic languages from SIL"
arch=('i686' 'x86_64')
url="http://scripts.sil.org/cms/scripts/page.php?item_id=AbyssinicaSIL"
license=('ofl')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
install=ttf.install
source=('http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=AbyssinicaSIL-1.500.zip&filename=AbyssinicaSIL-1.500.zip'
        'LICENSE::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt')
md5sums=('a3d943d18e303197c8d3d92d2de54d1e'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package() {
    cd "${srcdir}"
    install -Dm644 AbyssinicaSIL-1.500/AbyssinicaSIL-R.ttf ${pkgdir}/usr/share/fonts/TTF/AbyssinicaSIL-R.ttf
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
