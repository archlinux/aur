# Maintainer: John Iannandrea <github.com/isivisi>

_rackver=2.4.0

pkgname='vcvrack-questionablemodules-bin'
pkgver=2.1.9
pkgrel=1
pkgdesc="Questionable Modules for VCVRack"
url='https://github.com/isivisi/questionablemodules'
license=(GPL)
arch=(x86_64 aarch64)
groups=()
depends=(vcvrack)
makedepends=()

source=(
    "https://github.com/isivisi/questionablemodules/releases/download/v$pkgver/questionablemodules-$pkgver-lin-x64.vcvplugin"
)
sha256sums=(
    SKIP
)

package() {
	cp ./*.vcvplugin ~/.Rack2/plugins-lin-x64/
}
