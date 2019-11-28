# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=webkitgtk-bin
pkgver=1.0
pkgrel=2
pkgdesc="Legacy Web content engine for GTK+ 3 (precompiled)."
provides=('webkitgtk=3:2.4.11' 'webkitgtk2=3:2.4.11')
arch=('x86_64')
url="https://webkitgtk.org/"
license=('custom')
depends=(libxt libxslt sqlite libsoup 'enchant>=2.2' libgl geoclue2 gst-plugins-base-libs
         libsecret libwebp harfbuzz-icu 'icu>=61' gst-plugins-base gst-plugins-good gst-libav)
options=(!emptydirs)
source=('precompiled.tar.gz::https://dl.dropboxusercontent.com/s/aiw75lcurs35e7r/webkitgtk-bin.tar.gz')
sha256sums=('1aaeee74467d90dfaef57d23a434efd9b9b3f703dc8a689ada888b9e7c0717e0')

package() {
  cp -Rfp $srcdir/usr $pkgdir/
}
