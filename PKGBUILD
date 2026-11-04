# Maintainer: Alfonso de la Guarda <alfonsodg at gmail dot com>
pkgname=marker-enhanced-bin
pkgver=2026.11.04
pkgrel=1
pkgdesc="Markdown editor with Mermaid 10.9, batch PDF export, dark mode, and security fixes (prebuilt binary)"
arch=('x86_64')
url="https://github.com/alfonsodg/Marker"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'gtksourceview3'
  'gtkspell3'
  'webkit2gtk-4.1'
)
optdepends=(
  'mathjax2: alternative backend for rendering formulas'
  'pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX'
  'yelp: in-app help'
)
provides=('marker')
conflicts=('marker' 'marker-git' 'marker-enhanced-git')
source=("https://github.com/alfonsodg/Marker/releases/download/v${pkgver}/marker-enhanced-2026.11.04-x86_64.tar.gz")
sha256sums=('375704e77eb8fe74924143ecf0586136eb4c4ab8ff31b3c16a6b719b9c711ecc')

package() {
  cp -a "$srcdir/usr" "$pkgdir/usr"
}
