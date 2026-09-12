# Maintainer: smiley <smiley@aur.archlinux.org>
pkgname=rquickshare-x-bin
pkgver=0.11.9
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
b2sums=('4538a6ee22f4244bc4572f085bf17d7457502c4bc3844ccdd70541b908fc071efc482cacca034f1427f605fe3a780e7d5552e0b605354715ac5f53f4feb1857c')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
