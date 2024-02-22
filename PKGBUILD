# Maintainer: DeadNews <aurczpbgr@mozmail.com>

pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_name="images_upload_cli"
pkgver="3.0.1"
pkgrel=1
pkgdesc="Upload images via APIs"
url="https://github.com/DeadNews/images-upload-cli"
depends=(
    "python"
    "python-click"
    "python-dotenv"
    "python-httpx"
    "python-loguru"
    "python-pillow"
    "python-pyperclip"
    "python-rich"
)
makedepends=(
    "python-installer"
)
optdepends=(
    "libnotify: sending desktop notifications"
)
license=("MIT")
arch=("any")
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name}-$pkgver-py3-none-any.whl")
sha256sums=('6b1d042ca4ec465147311f0b0ecaea2b524968b13f25d5f622a85a262b55c267')

package() {
    python -m installer --destdir="${pkgdir}" "${_name}-$pkgver-py3-none-any.whl"
}
