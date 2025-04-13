# Maintainer: Felipe Facundes

pkgname=fontpreview_sixel
repo=fontpreview
pre_ver=1.0
pkgver=1.0.1
pkgrel=2
pkgdesc='Lightning-fast terminal font previewer with Sixel support. Uses fzf for interactive selection and ImageMagick for rendering. Perfect for designers and developers. Customizable text, size, and colors. Works in sixel terminals or outputs to image files.'
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
    'xdg-utils: for xdg-open fallback image viewer for terminals without Sixel support'
    'file: for identifying file'
)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$repo" || true
  echo "${pre_ver}.$(git rev-list --count HEAD)"
}

prepare() {
    cd "$srcdir/$repo" || true
}

build() {
    cd "$srcdir/$repo" || true
}

check() {
    cd "$srcdir/$repo" || true
}

package() {
    cd "$srcdir/$repo" || true
    install -Dm755 "fontpreview" "$pkgdir/usr/bin/fontpreview"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
