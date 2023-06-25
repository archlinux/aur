# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer-bin'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.1.8'
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
sha256sums=('27069a355be4d63d7dc84a46cb187f4b813e34d9ed8ce54d830ba030d196325a')

package() {
    install -Dm755 "spacer" "$pkgdir/usr/bin/spacer"
}
