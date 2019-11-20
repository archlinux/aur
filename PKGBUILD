# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>

pkgbase=gtksourceview-lolcode
pkgname=('gtksourceview2-lolcode' 'gtksourceview3-lolcode' 'gtksourceview4-lolcode')
pkgver=0.1
pkgrel=3
arch=('any')
url="https://lolcode.org/"
license=('MIT')
makedepends=('git')
optdepends=( 'lci-git: lolcode commandline interpreter')
_commit=f80e35eaa011ea5c3643fa88992e78b6fde08fbf
source=("$pkgbase-$pkgver-$pkgrel.src.tar.gz::https://github.com/Lucki/$pkgbase/archive/$_commit.tar.gz")
sha512sums=('ffe712fadb0e45709b827795e9fd3b5ac89e28454982cbc0fe629cbdad8f148ba0ce3d180b89ae8769cf190707f28e8d89f4e8bcb8632feea4d10f54a3876c1e')

package_gtksourceview2-lolcode()
{
    pkgdesc="lolcode syntax highlight support in gtksourceview2"
    depends=('gtksourceview2')

    install -Dm644 "$pkgbase-$_commit/lolcode.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/lolcode.lang"
    install -Dm644 "$pkgbase-$_commit/LICENSE" "$pkgdir/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_gtksourceview3-lolcode()
{
    pkgdesc="lolcode syntax highlight support in gtksourceview3"
    depends=('gtksourceview3')

    install -Dm644 "$pkgbase-$_commit/lolcode.lang" "$pkgdir/usr/share/gtksourceview-3.0/language-specs/lolcode.lang"
    install -Dm644 "$pkgbase-$_commit/LICENSE" "$pkgdir/usr/share/licenses/${pkgname[1]}/LICENSE"
}

package_gtksourceview4-lolcode()
{
    pkgdesc="lolcode syntax highlight support in gtksourceview4"
    depends=('gtksourceview4')

    install -Dm644 "$pkgbase-$_commit/lolcode.lang" "$pkgdir/usr/share/gtksourceview-4/language-specs/lolcode.lang"
    install -Dm644 "$pkgbase-$_commit/LICENSE" "$pkgdir/usr/share/licenses/${pkgname[2]}/LICENSE"
}
