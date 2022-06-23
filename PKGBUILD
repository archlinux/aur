# Maintainer: monsoon
pkgname=mantra
pkgver=1.0
pkgrel=1
pkgdesc="View online manual pages straight from the terminal."
arch=('any')
url="https://codeberg.org/theooo/mantra.py"
source=("https://codeberg.org/theooo/mantra.py/raw/branch/main/mantra")
# source=("${pkgname}::git+${git-repo-url}")
depends=("python" "python-beautifulsoup4" "fzf")
license=("custom")
sha512sums=("SKIP")

package() {
  install -Dm755 mantra "${pkgdir}/usr/bin/mantra"
}
