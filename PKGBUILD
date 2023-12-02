# Maintainer: George Li <georgel at airmail dot cc>
pkgname="ttf-profont-windows-bold"
pkgver="1.0.0"
pkgrel=1
pkgdesc='Profont Windows Bold Variant as a Truetype Font'
arch=('any')
url='http://tobiasjung.name/profont/'
license=('MIT')
source=('https://tobiasjung.name/downloadfile.php?file=ProFont-Windows-Bold.zip')
sha256sums=('2f72a110693168de1e8a5f45e892c7513611d11000a45f57f67180fcf707d0df')

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir/ProFont-Windows-Bold/ProFont-Bold-01/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
