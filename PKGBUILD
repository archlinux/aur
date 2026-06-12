# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>

pkgname=manglow
pkgver=0.2.0
pkgrel=1
pkgdesc="Render man pages as Markdown with glow"
arch=('any')
url="https://github.com/kusanaginoturugi/manglow"
license=('MIT')
depends=('fzf' 'glow' 'man-db' 'pandoc-cli')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('84d5d241d9fd12a9b50f5421422c23763eaed9665420a05589208ee5fa99b7f0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 manglow "${pkgdir}/usr/bin/manglow"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
