# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Narrow monospace font for programming and terminal emulators'
pkgname=ttf-fifteen
pkgver=20180531
pkgrel=1
url='https://fontlibrary.org/en/font/fifteen'
license=('custom:OFL')
source=('https://fontlibrary.org/assets/downloads/fifteen/c1556403ec283a1b5a23ad483af659f9/fifteen.zip'
        'OFL.txt::http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt')
sha512sums=('80d1eb36384cb073aa4cd4333d83a3edc678c51bf2447bcb588f3a0fb374d49a3b4f72c3453b6da9fa191a173752993f776b5da68630abb0483d9834bd757bd0'
            'fafa264e25460771db0b01d6f900a51401a6a76caaaeb46c109f2ec938afa24fa3d0d8f063f85d751965477081f96796c5ef94c5b4e2972d12c7c09342242509')
arch=('any')

package () {
	install -m 755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
	install -m 644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
	install -m 644 -D OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
