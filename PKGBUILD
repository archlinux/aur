# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_pkgname="bulk-downloader-for-reddit"
pkgname=python-bdfr
pkgver=2.5.1
pkgrel=1
pkgdesc="Bulk downloader for Reddit"
arch=('any')
url="https://github.com/aliparlakci/bulk-downloader-for-reddit"
depends=(
    'python'
    'python-beautifulsoup4'
    'python-dict2xml'
    'python-praw'
    'python-setuptools'
    'python-yaml'
    'yt-dlp'
)
makedepends=()
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aliparlakci/bulk-downloader-for-reddit/archive/refs/tags/v2.5.1.tar.gz")
md5sums=("c2248b957bc1c8337aa541ce2f315270")

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
