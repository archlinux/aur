# Maintainer: Alfonso de la Guarda <alfonsodg at gmail dot com>
pkgname=neomarker-bin
pkgver=2026.11.17
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
source=("https://github.com/alfonsodg/NeoMarker/releases/download/v${pkgver}/neomarker-2026.11.17-x86_64.tar.gz")
sha256sums=('16b3f10bab9cc8e0b1d20607fac40fd4b4c66be713e1d5cd802723d76e1d2d04')

package() {
  cp -a "$srcdir/usr" "$pkgdir/usr"
}
