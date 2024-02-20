# Maintainer: DeadNews <aurczpbgr@mozmail.com>

pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_name="images_upload_cli"
pkgver="3.0.0"
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
sha256sums=('251d678e03d84cfbcc96fc5970f54b6952ff1e7e60d82dfb7e1c7d90d146e493')

package() {
    python -m installer --destdir="${pkgdir}" "${_name}-$pkgver-py3-none-any.whl"
}
