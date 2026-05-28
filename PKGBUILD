# Maintainer: zapret-gui maintainers
pkgname=python-pyqt6-fluent-widgets
_pkgname=PyQt6-Fluent-Widgets
pkgver=1.11.2
pkgrel=1
pkgdesc="A fluent design widgets library based on PyQt6"
arch=("any")
url="https://qfluentwidgets.com"
license=("GPL3")
depends=(
  "python"
  "python-pyqt6"
)
makedepends=(
  "python-installer"
)
source=(
  "pyqt6_fluent_widgets-1.11.2-py3-none-any.whl::https://files.pythonhosted.org/packages/a7/ee/0c9499dd81bfdc1323529fee71b4a326b06b000869d8339915a9e6548aa4/pyqt6_fluent_widgets-1.11.2-py3-none-any.whl"
  "darkdetect-0.8.0-py3-none-any.whl::https://files.pythonhosted.org/packages/f2/f2/728f041460f1b9739b85ee23b45fa5a505962ea11fd85bdbe2a02b021373/darkdetect-0.8.0-py3-none-any.whl"
  "pyqt6_frameless_window-0.8.1-py3-none-any.whl::https://files.pythonhosted.org/packages/eb/de/d9f2d50ca3624a7455603ad0daee22073408b8ceb96f8b250a580ddbe88d/pyqt6_frameless_window-0.8.1-py3-none-any.whl"
)
noextract=(
  "pyqt6_fluent_widgets-1.11.2-py3-none-any.whl"
  "darkdetect-0.8.0-py3-none-any.whl"
  "pyqt6_frameless_window-0.8.1-py3-none-any.whl"
)
sha256sums=(
  "fe8c76f793eb1ccc31b5833cb15c1571655b38662abfb508c27bb7458d043593"
  "a7509ccf517eaad92b31c214f593dbcf138ea8a43b2935406bbd565e15527a85"
  "206924d28d998d06dd0e1e13986dd8ebf645a25e835cc02fcb8e365147507992"
)

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/pyqt6_fluent_widgets-1.11.2-py3-none-any.whl"
  python -m installer --destdir="$pkgdir" "$srcdir/darkdetect-0.8.0-py3-none-any.whl"
  python -m installer --destdir="$pkgdir" "$srcdir/pyqt6_frameless_window-0.8.1-py3-none-any.whl"
}
