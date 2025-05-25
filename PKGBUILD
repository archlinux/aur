# Maintainer: Sam Rose <hello@samwho.dev>

pkgname='spacer-bin'
pkgdesc='CLI tool to insert spacers in when command output stops'
pkgver='0.3.9'
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
sha256sums=('f5c3a3f35982a114ec2f82db2dee3282d89fe5d50c9a4cf6fa6302adc5f02886')

package() {
    install -Dm755 "spacer" "$pkgdir/usr/bin/spacer"
}
