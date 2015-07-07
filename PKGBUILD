# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>

pkgname=ttf-sil-lateef
pkgver=1
pkgrel=5
pkgdesc="OpenType Arabic font from SIL"
arch=('i686' 'x86_64')
url="http://scripts.sil.org/ArabicFonts"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-sil-arabic' 'ttf-sil-fonts')
install=ttf.install
source=('lateef.zip::http://scripts.sil.org/cms/scripts/render_download.php?site_id=nrsi&format=file&media_id=lateef_opentype&filename=LateefRegOT_ttf.zip' 'LICENSE::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt')
md5sums=('c59adf1aed6bdc4163edba707756acd0'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package() {
    cd "${srcdir}"
    install -Dm644 LateefRegOT.ttf ${pkgdir}/usr/share/fonts/TTF/LateefRegOT.ttf
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
