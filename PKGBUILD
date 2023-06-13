# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.1.0'
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
sha256sums=('7bfe4b413b10f1a5799955688d111eed2280bd51a70f5a4fe8d34db8aa1dbf1f')

package() {
    install -Dm755 "spacer" "$pkgdir/usr/bin/spacer"
}
