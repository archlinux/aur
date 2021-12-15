# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=webkitgtk-bin
epoch=3
pkgver=2.4.11
pkgrel=26
pkgdesc="Legacy Web content engine for GTK+ 3 (precompiled)."
provides=("webkitgtk=${epoch}:${pkgver}")
conflicts=("webkitgtk")
arch=("x86_64")
url="https://webkitgtk.org/"
license=("custom")
depends=("enchant>=2.2" "geoclue2" "gst-plugins-base-libs" "gtk3" "harfbuzz-icu" "libgl" "libsecret" "libwebp" "libxslt" "libxt")
optdepends=(
  "gst-libav: nonfree media decoding"
  "gst-plugins-base: free media decoding"
  "gst-plugins-good: media decoding"
  "gtk2: Netscape plugin support"
)
options=(!emptydirs)
source=("https://github.com/frealgagu/archlinux.webkitgtk/releases/download/${epoch}_${pkgver}-${pkgrel}/webkitgtk-${epoch}.${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=("94617d1274ff00f38f04ff04023f0840202ad9c47231b7b5a7d0d87d9628bc1d")

package() {
  cp -Rfp $srcdir/usr $pkgdir/
}
