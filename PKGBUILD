# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: neroices <me@slce.moe>

pkgname=r-quick-share-bin
pkgver=0.11.5
_glibcver=2.39
pkgrel=3
pkgdesc="Rust implementation of NearbyShare/QuickShare from Android for Linux."
arch=('x86_64')
url="https://github.com/Martichou/rquickshare"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
provides=("${pkgname%-bin}" 'rquickshare')
conflicts=("${pkgname%-bin}" 'rquickshare')
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-main_v${pkgver}_glibc-${_glibcver}_amd64.deb")
b2sums=('02ca5f543d94b3a1bf529387813bbb66b713478258a8edbf53e7561fc2739d6e62228e30d5373963f696065dab4cb0218a30f2c61d2533dc712b410d21f1f98d')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
