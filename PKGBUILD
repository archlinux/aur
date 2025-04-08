# Maintainer: Felipe Facundes

pkgname=fontpreview_sixel
pre_ver=1.0
pkgver=1.0.1
pkgrel=1
pkgdesc='A lightning-fast, terminal-based font previewer with Sixel graphics support, designed for designers and developers who work with fonts in Linux/Unix environments.'
arch=('any')
url='https://github.com/felipefacundes/fontpreview'
license=('GPL')
depends=(
    'bash'
    'fzf'
    'libsixel'
    'imagemagick'
)
optdepends=(
    'feh: fallback image viewer for terminals without Sixel support'
    'file: for identifying file'
)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname" || true
  echo "${pre_ver}.$(git rev-list --count HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname" || true
}

build() {
    cd "$srcdir/$pkgname" || true
}

check() {
    cd "$srcdir/$pkgname" || true
}

package() {
    cd "$srcdir/$pkgname" || true
    install -Dm755 "fontpreview" "$pkgdir/usr/bin/fontpreview"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
