# Maintainer: deadnews <deadnewsgit@gmail.com>

pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_name="images_upload_cli"
pkgver="3.0.6"
pkgrel=1
pkgdesc="Upload images via APIs"
url="https://github.com/deadnews/images-upload-cli"
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
sha256sums=('160babb525838d5c44795832c1172a5cb2c100619e4116004eee4c5ed816619a')

package() {
    python -m installer --destdir="${pkgdir}" "${_name}-$pkgver-py3-none-any.whl"
}
