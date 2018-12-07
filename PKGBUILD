# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

binname='dcos'
pkgname="$binname-cli-bin"
pkgver='0.7.3'
pkgrel=1
pkgdesc='The DC/OS command line interface utility'
url='https://docs.mesosphere.com/latest/cli/'
arch=('x86_64')
license=('Apache')
conflicts=('dcos-cli')
source=("https://downloads.dcos.io/binaries/cli/linux/x86-64/$pkgver/$binname")
sha256sums=('859af639f3e65b1882726657788c6a5160d8d6965fdc1e3873c8d8d80c76e18a')

package() {
    install -Dm755 "$srcdir/$binname" -t "$pkgdir/usr/bin"
}
