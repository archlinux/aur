# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_pkgname="bulk-downloader-for-reddit"
pkgname=python-bdfr
pkgver=2.6.0
pkgrel=1
pkgdesc="Bulk downloader for Reddit"
arch=('any')
url="https://github.com/aliparlakci/bulk-downloader-for-reddit"
depends=(
    'python'
    'python-beautifulsoup4'
    'python-dict2xml'
    'python-pip'
    'python-praw'
    'python-setuptools'
    'python-yaml'
    'yt-dlp'
)
makedepends=()
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aliparlakci/bulk-downloader-for-reddit/archive/refs/tags/v2.6.0.tar.gz")
md5sums=("de1dc6f0597fb120bea267aee41c39a0")

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
