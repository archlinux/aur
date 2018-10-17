# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, tar files
pkgver="0.0.2"
pkgrel=1
md5sums=("34cf699ee072104d049d86dc02f065ce")

# info
pkgname="paper-bin"
pkgdesc="Plaintext writer supporting LaTeX and markdown"

_name=paper
arch=("x86_64")
license=("unknown")
url="https://cloud.iostud.io/index.php/s"
_versionFolder="nXzbe5gPE8rxj8e"
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
