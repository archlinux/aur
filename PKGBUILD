pkgname=resolvify
pkgver=1.0
pkgrel=3
pkgdesc="Batch ffmpeg transcoder with optional CustomTkinter GUI"
arch=("any")
url="https://github.com/"
license=("MIT")

depends=(
  "python"
  "tk"
  "ffmpeg"
  "kitty"
)

optdepends=(
  "python-rich: pretty CLI progress output (pip install rich)"
  "python-customtkinter: GUI support (pip install customtkinter)"
)

source=("resolvify")
sha256sums=("SKIP")

package() {
  install -Dm755 "$srcdir/resolvify" "$pkgdir/usr/bin/resolvify"
}
