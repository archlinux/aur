# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=castoro
pkgbase=$_name-font
pkgname=(otf-$_name otf-$_name-titling otf-$_name-variable ttf-$_name ttf-$_name-titling ttf-$_name-variable)
pkgver=3.010
_tagver=${pkgver%0}
pkgrel=2
pkgdesc='a synthesis of aspects of assorted Dutch types from the 16–18th Centuries'
arch=(any)
url="https://github.com/Tirotypeworks/${_name^}"
license=(OFL-1.1-no-RFN)
_archive="${_name^}-$_tagver"
source=("$url/archive/v$_tagver/$_archive.tar.gz")
sha256sums=('7ac2fb2665731128da9eaf1c6aeb05e6b3072c18db1455fc9fd9bd0f8447ca59')

package_otf-castoro() {
    provides=("$pkgbase=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/Castoro-static/OTF/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}

package_otf-castoro-titling() {
    provides=("$pkgbase-titling=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/CastoroTitling/OTF/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}

package_otf-castoro-variable() {
    provides=("$pkgbase-variable=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTFVF/" fonts/Castoro-variable/OTFVF/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}

package_ttf-castoro() {
    provides=("$pkgbase=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/Castoro-static/TTF/*.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}
package_ttf-castoro-titling() {
    provides=("$pkgbase-titling=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/CastoroTitling/TTF/*.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}

package_ttf-castoro-variable() {
    provides=("$pkgbase-variable=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTFVF/" fonts/Castoro-variable/TTFVF/*.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}
