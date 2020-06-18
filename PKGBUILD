# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-archivo-black
pkgver=1.006
pkgrel=1
pkgdesc="Archivo is a grotesque sans serif typeface family from Omnibus Type"
arch=('any')
url="https://github.com/Omnibus-Type/ArchivoBlack"
license=('custom:OFL')
source=("https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/master/fonts/ttf/ArchivoBlack-Regular.ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/master/fonts/ttf/ArchivoBlack-Italic.ttf"
        "https://raw.githubusercontent.com/Omnibus-Type/ArchivoBlack/master/OFL.txt")
sha256sums=('3cdaf0609a90ce679499407fc7761f3adb5ae8d3c3237249c2d11f5f095eda7d'
            '721b3c19efaf59c62316b4192a32fbe60856c3f87bf7e4648bab7fdb70926150'
            '000a3db5300ab7645fb1f861061987f7a4320939ae733d5c29aab3df6a281447')

package() {
	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF
	install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
