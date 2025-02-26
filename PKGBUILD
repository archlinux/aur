# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Matt Kline <matt at bitbashing dot io>

_pkgname=bodoni
pkgname=(otf-$_pkgname ttf-$_pkgname ttf-$_pkgname-variable)
pkgbase=$_pkgname-font
pkgver=2.3
pkgrel=1
pkgdesc='A serif font by indestructible type* inspired by Giambattista Bodoni'
arch=(any)
url=https://indestructibletype.com/Bodoni
license=(OFL)

_url=https://github.com/indestructible-type/Bodoni
source=($_url/archive/$pkgver.tar.gz)
sha256sums=(13f76c99c6c8a7b640528180438cf3fa031d68c3561f853e1328b492891128f2)

package_otf-bodoni() {
    cd "$srcdir"/$_pkgname-$pkgver
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-bodoni() {
    cd "$srcdir"/$_pkgname-$pkgver
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-bodoni-variable() {
    cd "$srcdir"/$_pkgname-$pkgver
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}
