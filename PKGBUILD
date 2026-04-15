# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-universal-startfile
pkgver=0.4
pkgrel=2
pkgdesc="A cross-platform version of 'os.startfile' from the standard library."
arch=('any')
url="https://github.com/jacebrowning/universal-startfile"
license=('MIT')
depends=('python')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/26/3c/17a8c3422aebcaa914e486983376dc6a518e205b672328568dc37b2e84b1/universal_startfile-${pkgver}-py3-none-any.whl")
noextract=("universal_startfile-${pkgver}-py3-none-any.whl")
sha256sums=('5de70f9773bc392fe7c93013d0c05b2cc1beec60b9220e909cf8e9411b15d262')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/universal_startfile-${pkgver}-py3-none-any.whl"
}
