# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer-bin'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.2'
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
sha256sums=('5a476dec2ae898aaef229fbc78f99215e301027a036c4683ef3648f904d366f6')

package() {
    install -Dm755 "spacer" "$pkgdir/usr/bin/spacer"
}
