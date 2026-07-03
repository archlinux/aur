# Maintainer: smiley <smiley@aur.archlinux.org>
pkgname=rquickshare-x-bin
pkgver=0.11.8
_glibcver=2.39
pkgrel=1
pkgdesc="Rust implementation of NearbyShare/QuickShare from Android for Linux - fork with Windows support, dark mode, theme selection, and transfer speed meter"
arch=('x86_64')
url="https://github.com/oop7/rquickshare-x"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-main_v${pkgver}_glibc-${_glibcver}_amd64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-main_v${pkgver}_glibc-${_glibcver}_amd64.deb")
b2sums=('f88030af00c25f216d7df9b645f1e0648077f72c07d85a07497fa7f2d9f5e7d54379fb1d2f6ee65027e28210e5f12b12f275f41f7fc20f5c664b2d280e3007c7')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
