# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, tar files
pkgrel=1
pkgver="0.0.3"
md5sums=("33c026d4c51d74dd54ea395f4096ff3a")
_versionFolder="QFLj6wErSXBKaBT"

# info
pkgname="paper-bin"
pkgdesc="Plaintext writer supporting LaTeX and markdown"

_name=paper
arch=("x86_64")
license=("unknown")
url="https://cloud.iostud.io/index.php/s"
_path="download?path=%2F&files=paper-linux-x64-${pkgver}.tar.gz"

provides=("${_name}")
depends=("texlive-core")

source=(
  "${url}/${_versionFolder}/${_path}"
)

package() {
  mkdir -p ${pkgdir}/opt/ ${pkgdir}/usr/bin/
  mv ${srcdir}/paper-linux-x64 ${pkgdir}/opt/paper
  ln -s /opt/paper/paper ${pkgdir}/usr/bin/paper
}
