# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=garamontio
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.082
pkgrel=1
pkgdesc='a fork of EB Garamond'
arch=(any)
url="https://m-casanova.codeberg.page/${_name^}/"
_url="https://codeberg.org/m-casanova/${_name^}"
license=(OFL)
_archive="${_name^}-$pkgver"
source=("$_archive-otf.zip::$_url/releases/download/v$pkgver/${_name}_otf.zip"
        "$_archive-ttf.zip::$_url/releases/download/v$pkgver/${_name}_ttf.zip"
        "$_archive-var.zip::$_url/releases/download/v$pkgver/${_name}_var.zip"
        "$_archive.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('2da598ecdeed29bc787458077443577859f6981041e3684eef8c8eaa90af4c52'
            '3e19d7d4ef827b7399d464b4429d109d406cd525dcee77e1b279e1000c710c6e'
            '89d0098741e0b5274200d25ba436732c3b6e8bf4b45be6b719790186dee38de7'
            '0febd51cc042c9632c3a651b8531fa752113140788c6487e876f75cfbba285ed')

package_otf-garamontio() {
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ${_name^}-*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name/OFL.txt
}

package_ttf-garamontio() {
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ${_name^}-*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name/OFL.txt
}

package_ttf-garamontio-variable() {
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ${_name}*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name/OFL.txt
}
