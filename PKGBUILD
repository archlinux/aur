# Maintainer: Noah Vogt <noah@noahvogt.com>
pkgname=issuu-dl
pkgver=0.5.1
pkgrel=2
pkgdesc="a simple downloader for issuu.com (supports pdf and cbz output formats)"
arch=('any')
url="https://github.com/noahvogt/issuu-dl"
license=('GPL-3.0-only')
depends=('python' 'python-termcolor' 'img2pdf' 'python-tqdm' 'python-typer')
makedepends=('git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('1909fb7dc5b8656b55781747ac9084bb0dbd60c8e3fd68cfb5fa7499c37a5245')

package() {
    cd "$pkgname"
    install -Dm755 issuu-dl "$pkgdir/usr/bin/issuu-dl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
