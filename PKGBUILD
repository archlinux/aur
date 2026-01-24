pkgname=catgirldownloader
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK4 application that downloads images from nekos.moe"
arch=('any')
url="https://github.com/NyarchLinux/CatgirlDownloader"
license=('GPL-3.0-only')

depends=(
  'python'
  'python-gobject'
  'python-requests'
  'gtk4'
  'libadwaita'
  'glib2'   # for gsettings schemas runtime
)

source=(
  "${pkgname}-v${pkgver}.tar.gz::https://github.com/NyarchLinux/CatgirlDownloader/releases/download/${pkgver}/catgirldownloader-v${pkgver}.tar.gz"
)
sha256sums=('1c74c08bd77f421e146dfa4a3dfc46049f05bf3b141aba8caac66b18bd2947f6')

package() {
  # Install the whole filesystem tree from the tarball
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
