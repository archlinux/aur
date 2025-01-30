# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer-bin'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.3.1'
pkgrel='1'
arch=('x86_64')
url='https://github.com/samwho/spacer'
license=('MIT')
depends=()
optdepends=()
makedepends=()
checkdepends=()
provides=(spacer)
conflicts=(spacer)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/samwho/spacer/releases/download/v${pkgver}/spacer-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('9d58f9bf8177e49f217277e177a6d7a2f31b4744d9ffefac55b4a1c9d029d951')

package() {
    install -Dm755 "spacer" "$pkgdir/usr/bin/spacer"
}
