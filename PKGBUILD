# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer-bin'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.3.0'
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
sha256sums=('2b87b9f400d7d68d966e0edb4e6ede9fada0fcf9ba80169bb45e52daa6556399')

package() {
    install -Dm755 "spacer" "$pkgdir/usr/bin/spacer"
}
