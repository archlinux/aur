# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, tar files
pkgver="0.0.1"
pkgrel=2
md5sums=("1e520fd2a07dabcf40a4cf35be9165ab")

# info
pkgname="paper-bin"
pkgdesc="Plaintext writer supporting LaTeX and markdown"

_name=paper
arch=("x86_64")
license=("unknown")
url="https://cloud.iostud.io/index.php/s/s6wk4mZDZMKZSBr"
_path="/download?path=%2F&files=paper-linux-x64.tar.gz"

provides=("${_name}")
depends=("texlive-core")

source=(
  "${url}${_path}"
)

package() {
  mkdir -p ${pkgdir}/opt/ ${pkgdir}/usr/bin/
  mv ${srcdir}/paper-linux-x64 ${pkgdir}/opt/paper
  ln -s /opt/paper/paper ${pkgdir}/usr/bin/paper
}
