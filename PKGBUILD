# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=aqademia

pkgname=latex-template-aqademia
pkgver=3.0
pkgrel=3
pkgdesc="A LaTeX template for printable academic documents."

arch=('any')
license=('GPL-2.0')
url="https://git.sr.ht/~groctel/$_name"

source=("$url/refs/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('fdf663d2e0b74393030d0b5a1b028f38a4f7922470c435d2b5cd45d147babfa209c6bb7b70527f687a3658569b062c4174061784c9f90cf4da37a4c21f4c57b9')

depends=('texlive-core')

package () {
    cd "$srcdir/$_name-$pkgver"
    install -m 0644 -D aqademic.cls "$pkgdir/usr/share/texmf-dist/tex/latex/$_name/aqademic.cls"
    install -D -m644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
