# Maintainer: fekoneko <https://github.com/fekoneko>

pkgname='piximan-bin'
pkgver=0.11.4
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
sha256sums_x86_64=('094f111836367ab08c61c6397582453500acc99f9dfe89578c1029a1e0699c4a')
sha256sums_i686=('094f111836367ab08c61c6397582453500acc99f9dfe89578c1029a1e0699c4a')
sha256sums_aarch64=('094f111836367ab08c61c6397582453500acc99f9dfe89578c1029a1e0699c4a')

package() {
  install -Dm755 'piximan' "$pkgdir/usr/bin/piximan"
  install -Dm644 'COPYING' "$pkgdir/usr/share/licenses/piximan/COPYING"
}
