# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: H. Rosendahl <h at ro dot sendahl dot de>

pkgname=(otf-jost ttf-jost ttf-jost-variable)
pkgbase=jost-font
pkgver=3.7
pkgrel=1
pkgdesc='A sans-serif font by indestructible type* inspired by 1920s German sans-serifs'
arch=(any)
url=https://indestructibletype.com/Jost
license=(OFL)

_url=https://github.com/indestructible-type/Jost
_commit=6eba3c279d0e3a17dbb891f569625bf0dd91aedb
source=($_url/archive/$_commit.tar.gz)
sha256sums=(a3e712c3d04d4bac1d3b9d6f0ae02b16b4a7a081f369350063741d68a7075de7)

_pkgname=${pkgbase%-font}

package_otf-jost() {
    cd "$srcdir"/Jost-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/$pkgname AUTHORS.txt \
        CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-jost() {
    cd "$srcdir"/Jost-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/$pkgname AUTHORS.txt \
        CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-jost-variable() {
    cd "$srcdir"/Jost-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/Jost-VF.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/$pkgname AUTHORS.txt \
        CONTRIBUTORS.txt FONTLOG.txt README.md
}
