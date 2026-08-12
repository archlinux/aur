# Maintainer: L1bT0rch <L1bT0rch@proton.me>
# Contributor: Vivek Das Mohapatra <vivek@collabora.com>

pkgname=holo-plymouth-themes
_tag=v0.7
pkgver=${_tag#v}
pkgrel=2
arch=('any')
url='https://github.com/evlav/holo-plymouth-themes'
pkgdesc='Boot splash theme with optional progress bar, title, and messages'
license=('GPL-2.0-or-later') # same as plymouth, without which this is useless
makedepends=(git rsync)
source=("$pkgname::git+https://github.com/evlav/${pkgname}#tag=${_tag}")
b2sums=('SKIP')

build() {
    true
}

package () {
    rsync --exclude=assets -a "$srcdir"/$pkgname/* "$pkgdir"
}
