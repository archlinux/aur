# Maintainer: Marco Gulino <marco at gmail dot com>

pkgname=starquew
pkgver=0.1.1
_buildver=209
pkgrel=1
pkgdesc="A lightweight, web based sequence generator and INDI client written in Python and React."
arch=("any")
url="https://github.com/faressoft/terminalizer"
license=("GPLv3")
depends=("python" "python-pip" "redis")
optdepends=("nginx")
install="install"

# Daily builds link - expires after 10 builds
# source=("https://gulinux.net/downloads/StarQuew/ci-${_buildver}/StarQuew-${pkgver}-b${_buildver}-Linux.tar.gz")
# Stable build
source=("https://github.com/GuLinux/StarQuew/releases/download/${pkgver}/StarQuew-${pkgver}-b${_buildver}-Linux.tar.gz")
md5sums=('c3472786e3520876d83d7acfd2d491c8')

package() {
  cd "${srcdir}/StarQuew-${pkgver}-b${_buildver}-Linux"
  install -dm755 "${pkgdir}/usr"
  cp -av bin lib share "${pkgdir}/usr/"
}
