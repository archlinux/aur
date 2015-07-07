# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>

pkgname=ttf-sil-lateef
pkgver=1.001
pkgrel=1
pkgdesc="OpenType Arabic font from SIL"
arch=('i686' 'x86_64')
url="http://scripts.sil.org/ArabicFonts"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-sil-arabic' 'ttf-sil-fonts')
install=ttf.install
source=('http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Lateef_OT_1_001&filename=LateefRegOT_1.001.zip'
        'LICENSE::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt')
md5sums=('c060ab84ab33ae8f991103258b8e7f22'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package() {
    cd "${srcdir}"
    install -Dm644 LateefRegOT.ttf ${pkgdir}/usr/share/fonts/TTF/LateefRegOT.ttf
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
