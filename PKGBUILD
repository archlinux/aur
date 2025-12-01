# Contributor: Erkin Batu Altunbaş <erkin@sdf.org>
pkgname=eisl
pkgver=5.60
pkgrel=1
pkgdesc="Easy-ISLisp is an interpreter and compiler compatible with ISLisp standard."
arch=('x86_64' 'i686')
url="https://github.com/sasagawa888/eisl"
license=("custom")
depends=("sh" "gcc" "make")

source=("https://github.com/sasagawa888/eisl/archive/ｖ${pkgver}.tar.gz")
sha256sums=('deeb2d1342f56f9ddae76de7727ead7de16db774c9342655c21d673c5384ce8e')

package()
{
    cd "$pkgname--$pkgver"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
