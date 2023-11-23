# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=drafting
pkgname=(otf-$_pkgname ttf-$_pkgname ttf-$_pkgname-variable)
pkgbase=$_pkgname-font
pkgver=1.1
pkgrel=3
pkgdesc='A monospace font by indestructible type* inspired by typewriters'
arch=(any)
url=https://indestructibletype.com/Drafting
license=(OFL)

_url=https://github.com/indestructible-type/Drafting
_commit=14182b3381808ecb310dbe83673ae86a7e4e0e2d
source=($_url/archive/$_commit.tar.gz)
sha256sums=(d87d678d1d5ec86eb2f025f42a4722f8873fce953318bb4421953ec700dbe3a4)

package_otf-drafting() {
    cd "$srcdir"/Drafting-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/$pkgname AUTHORS.txt \
        CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-drafting() {
    cd "$srcdir"/Drafting-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/$pkgname AUTHORS.txt \
        CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-drafting-variable() {
    cd "$srcdir"/Drafting-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/$pkgname AUTHORS.txt \
        CONTRIBUTORS.txt FONTLOG.txt README.md
}
