# Maintainer: Steven Braun <steven.braun.mz@gmail.com >
pkgname=arxiv-downloader
pkgver=1.0.0
pkgrel=1
pkgdesc="The arXiv PDF Command-Line Interface Downloader"
arch=('any')
url="https://github.com/braun-steven/arxiv-downloader"
license=('MIT')
depends=('python' 'python-arxiv')
source=("git+https://github.com/braun-steven/arxiv-downloader.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
  # Install the script and other files
  install -Dm755 "$pkgname"/bin/arxiv-downloader "$pkgdir/usr/bin/arxiv-downloader"
}
