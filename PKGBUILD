# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=chomsky
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=2.3
pkgrel=1
pkgdesc='A font in the style of the New York Times masthead'
arch=(any)
url="https://github.com/ctrlcctrlv/$_name"
license=(OFL)
_archive="$_name-$pkgver"
source=("$_archive.tgz::$url/archive/v$pkgver.tar.gz")
sha256sums=('23198f26aa149112914c0487ce5180921fedb869a40b1175f308ad577085d532')

package_otf-chomsky() {
    provides=("$pkgbase")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" dist/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
