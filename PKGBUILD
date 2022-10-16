# Maintainer: Riya Bisht <echo "aGFja2luZmluaXR5MTAwMUBnbWFpbC5jb20K" | base64 -d>
# Maintainer: Snehit Sah <echo "aGlAc25laGl0LmRldgo=" | base64 -d>

_pkgname=tgfs-ui
pkgname="${_pkgname}-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="GUI for TGFS"
arch=("any")
url="https://github.com/tg-fs/tgfs-ui"
license=("GPL")
depends=("tgfs-git")
source=("${_pkgname}.tar.gz::${url}/releases/download/0.0.1/tgfs_ui_bundle.tar.gz")
sha256sums=("6bdf9eef2e7725fc6d687e51a2e3d4a0bd8b34c9ba8346d236635d80750656d8")

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/"
  mkdir -p "${pkgdir}/usr/data/"
  cp ${srcdir}/tgfs_ui_bundle/* "${pkgdir}/usr/" -r
  ln -s ../tgfs_ui "${pkgdir}/usr/bin/tgfs_ui"
}
