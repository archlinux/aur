# Maintainer: Julien Noblet

pkgname="keepass-plugin-yet-another-favicon-downloader"
_pkgname="keepass-yet-another-favicon-downloader"
pkgver=1.1.1.0
pkgrel=1
pkgdesc="Yet Another Favicon Downloader for KeePass 2.x"
arch=("any")
url="https://github.com/navossoc/KeePass-Yet-Another-Favicon-Downloader"
license=("GPLv2")
depends=("keepass>=2.34")
#conflicts=("keepass-favicon")
source=("YetAnotherFaviconDownloader.plgx::$url/releases/download/v$pkgver/YetAnotherFaviconDownloader.plgx")
sha256sums=('61d1f75fe5ac45d047e540c741a138d356a3c0a458781b641857efb994824559')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/keepass/plugins"
  cp YetAnotherFaviconDownloader.plgx "$pkgdir/usr/share/keepass/plugins"
}

# vim:set ts=2 sw=2 et:

