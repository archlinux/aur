# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

binname='dcos'
pkgname="$binname-cli-bin"
pkgver='1.1.2'
pkgrel=1
pkgdesc='The DC/OS command line interface utility'
url='https://docs.mesosphere.com/latest/cli/'
arch=('x86_64')
license=('Apache')
conflicts=('dcos-cli')
source=("https://downloads.dcos.io/binaries/cli/linux/x86-64/$pkgver/$binname")
sha256sums=('feaa251744c2346fb4da834fd223de3291c53bccaf8ea225a7bc2ebc5edf1190')

package() {
    install -Dm755 "$srcdir/$binname" -t "$pkgdir/usr/bin"
}
