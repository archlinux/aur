# Maintainer : David Beley <dbeley@protonmail.com>
pkgname=rid-git
pkgver=1.0
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="rid - Reddit Image Downloader - Simple bash script to download images from a subreddit."
arch=('any')
url="https://github.com/dbeley/${pkgname%-git}"
license=('GPL2')
makedepends=('git')
depends=(
        'bash'
        'wget'
        'jq'
        )
source=("git+https://github.com/dbeley/${pkgname%-git}")
md5sums=("SKIP")

package () {
            install -Dm755 "$srcdir/${pkgname%-git}/rid" "$pkgdir/usr/bin/rid"
}
