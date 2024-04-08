# Maintainer: DeadNews <deadnewsgit@gmail.com>

pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_name="images_upload_cli"
pkgver="3.0.3"
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
sha256sums=('1868de4e9484b001bf26b4bad971c3f8eb8df7ee3215ee0d650cf1293d8bb378')

package() {
    python -m installer --destdir="${pkgdir}" "${_name}-$pkgver-py3-none-any.whl"
}
