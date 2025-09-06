# Maintainer: fekoneko <https://github.com/fekoneko>

pkgname='piximan-bin'
pkgver=0.11.3
pkgrel=1
pkgdesc='Pixiv batch downloader and local collection viewer'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/fekoneko/piximan'
license=('GPL-3.0-only')
conflicts=('piximan')
provides=('piximan')

_srcname="$pkgname-$pkgver.tar.gz"
_srcurlprefix="https://github.com/fekoneko/piximan/releases/download/v$pkgver/piximan_v$pkgver"
source_x86_64=("$_srcname::${_srcurlprefix}_linux_amd64.tar.gz")
source_i686=("$_srcname::${_srcurlprefix}_linux_386.tar.gz")
source_aarch64=("$_srcname::${_srcurlprefix}_linux_arm64.tar.gz")
sha256sums_x86_64=('84e008dc25d66962aaf123e463eb545f911ef1ed62a3875feec402f8fbbad5cc')
sha256sums_i686=('84e008dc25d66962aaf123e463eb545f911ef1ed62a3875feec402f8fbbad5cc')
sha256sums_aarch64=('84e008dc25d66962aaf123e463eb545f911ef1ed62a3875feec402f8fbbad5cc')

package() {
  install -Dm755 'piximan' "$pkgdir/usr/bin/piximan"
  install -Dm644 'COPYING' "$pkgdir/usr/share/licenses/piximan/COPYING"
}
