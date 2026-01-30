# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='monochrome'
pkgver=2.0.0
pkgrel=1
pkgdesc="Monochrome is a lightweight, privacy-focused music streaming client designed for high-fidelity audio playback. Built with modern web technologies, it provides a clean, distraction-free listening experience."
arch=('x86_64')
url=https://github.com/SamidyFR/monochrome
license=('HIPPOCRATIC LICENSE')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=("$pkgname")
conflicts=("$pkgname")
source_x86_64=(
  "$pkgname-$pkgver.zip::https://downloads.samidy.com/Monochrome-linux.zip"
)
sha256sums_x86_64=("SKIP")

package() {
  install -d "$pkgdir/usr/bin"
  cp "$srcdir/Monochrome" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/Monochrome" "$pkgdir/usr/bin/$pkgname"
}
