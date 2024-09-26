# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=castoro
pkgbase=$_name-font
pkgname=(otf-$_name otf-$_name-titling ttf-$_name ttf-$_name-titling)
pkgver=2.040
_tagver=${pkgver%0}
pkgrel=1
pkgdesc='a synthesis of aspects of assorted Dutch types from the 16–18th Centuries'
arch=(any)
url="https://github.com/Tirotypeworks/${_name^}"
license=(OFL-1.1-no-RFN)
_archive="${_name^}-$_tagver"
source=("$url/archive/v$_tagver/$_archive.tar.gz")
sha256sums=('37d829b3a2faf1ad1e70378d55e99f8bcbfd035468a607dba3b077122825ba22')

package_otf-castoro() {
    provides=("$pkgbase=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/Castoro/OTF/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}

package_otf-castoro-titling() {
    provides=("$pkgbase-titling=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/CastoroTitling/OTF/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}

package_ttf-castoro() {
    provides=("$pkgbase=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/Castoro/TTF/*.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}
package_ttf-castoro-titling() {
    provides=("$pkgbase-titling=$pkgver")
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/CastoroTitling/TTF/*.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
}
