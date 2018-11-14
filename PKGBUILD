# Maintainer: Julien Noblet

pkgname="keepass-plugin-yet-another-favicon-downloader"
_pkgname="keepass-yet-another-favicon-downloader"
pkgver=1.2.0.0
pkgrel=1
pkgdesc="Yet Another Favicon Downloader for KeePass 2.x"
arch=("any")
url="https://github.com/navossoc/KeePass-Yet-Another-Favicon-Downloader"
license=("GPLv2")
depends=("mono>=4.8" "keepass>=2.34")
#conflicts=("keepass-favicon")
source=("YetAnotherFaviconDownloader.plgx::$url/releases/download/v$pkgver/YetAnotherFaviconDownloader.plgx")
sha256sums=('ce637fa5575dcb68795aefa887cf856abcf631ecd9cae48954b80cc673dfe7b7')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/keepass/plugins"
  cp YetAnotherFaviconDownloader.plgx "$pkgdir/usr/share/keepass/plugins"
}

# vim:set ts=2 sw=2 et:

