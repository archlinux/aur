pkgname=catgirldownloader
pkgver=0.5
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
sha256sums=('f27f2a42b294dedea7afb673adc08634433c4c52d55e0350b208bb2a7250a81a')

package() {
  # Install the whole filesystem tree from the tarball
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
