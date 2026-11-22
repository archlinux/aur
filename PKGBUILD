# Maintainer: Denis Kopin <deng@lixun.app>
pkgname=lixun-ocr
pkgver=0.7.10
pkgrel=1
pkgdesc="Lixun OCR metapackage: pulls in tesseract + English language data"
arch=('any')
url="https://lixun.app"
license=('MIT OR Apache-2.0')
depends=("lixun=$pkgver" 'tesseract' 'tesseract-data-eng')

package() {
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/README" <<'EOF'
This metapackage carries no files. See /usr/share/licenses/lixun/ for
license texts that apply to the parent project.
EOF
}
