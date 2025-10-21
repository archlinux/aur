# Maintainer: Joe Pfeiffer <joepfeiffer16@gmail.com>
pkgname=smoothdev-commit
pkgdesc="A CLI tool that generates commit messages using AI. This tool integrates with your git workflow to analyze staged changes and generate meaningful commit messages."
_name="${pkgname}-message-cli"
pkgver=1.0.5
pkgrel=1
pkgdesc=""
arch=("x86_64")
url="https://www.smoothdev.io/about"
license=('MIT')
groups=()
depends=(python python-requests)
makedepends=(python-installer)
checkdepends=()
optdepends=()
provides=("smoothdev-commit-message-cli")
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=("9a47d5df33a9e80eee65a4400803c74af9c1e7111625b59b7cb8881aa47dfc2f")

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
