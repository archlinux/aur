# Maintainer: Alfonso de la Guarda <alfonsodg at gmail dot com>
pkgname=neomarker-bin
pkgver=2026.11.16
pkgrel=1
pkgdesc="Markdown editor with Mermaid 12, batch PDF export, dark mode and security fixes (prebuilt binary)"
arch=('x86_64')
url="https://github.com/alfonsodg/NeoMarker"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'gtksourceview4'
  'gtkspell3'
  'webkit2gtk-4.1'
)
optdepends=(
  'mathjax2: alternative backend for rendering formulas'
  'pandoc: export to HTML, PDF, RTF, ODT, DOCX, LaTeX'
  'yelp: in-app help'
)
provides=('neomarker')
conflicts=('neomarker' 'neomarker-git' 'marker' 'marker-enhanced-bin' 'marker-enhanced-git')
replaces=('marker-enhanced-bin')
source=("https://github.com/alfonsodg/NeoMarker/releases/download/v${pkgver}/neomarker-2026.11.16-x86_64.tar.gz")
sha256sums=('18ab2d777a19e610353c876773e82119f0f3c756ff13835b85d598fc0f3c7892')

package() {
  cp -a "$srcdir/usr" "$pkgdir/usr"
}
