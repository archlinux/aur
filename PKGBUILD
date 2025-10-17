# Maintainer: Filip Repstad Spanne <filip.spanne@gmail.com>
#
pkgname=vespa-cli
pkgver=8.589.18
pkgrel=1
pkgdesc="Command-line interface for Vespa AI search and data serving platform"
arch=('x86_64')
url="https://vespa.ai"
license=('Apache')
depends=('bash')
source=("https://github.com/vespa-engine/vespa/releases/download/v${pkgver}/vespa-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('686e8bedd2fa6d1fe5acff0fa0737dcaa1049ca87d9059c7167ff7bcfee430f6')

package() {
    cd "$srcdir/${pkgname}_${pkgver}_linux_amd64"

    install -Dm755 "bin/vespa" "$pkgdir/usr/bin/vespa"

}
