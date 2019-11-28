# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=webkitgtk2-bin
pkgver=1.0
pkgrel=1
pkgdesc="Legacy Web content engine for GTK+ 3 (precompiled)."
provides=('webkitgtk=3:2.4.11' 'webkitgtk2=3:2.4.11')
arch=('x86_64')
url="https://webkitgtk.org/"
license=('custom')
depends=(libxt libxslt sqlite libsoup 'enchant>=2.2' libgl geoclue2 gst-plugins-base-libs
         libsecret libwebp harfbuzz-icu 'icu>=61' gst-plugins-base gst-plugins-good gst-libav)
options=(!emptydirs)
source=('precompiled.tar.gz::https://dl.dropboxusercontent.com/s/fovxx2md6rmkco0/webkitgtk2-bin.tar.gz')
sha256sums=('6d2755d48fcb0c5aab05db1ef12b374f0c9d8af6593ed6c8831e90e2ceab5c8f')

package() {
  cp -Rfp $srcdir/usr $pkgdir/
}
