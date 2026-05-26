# Maintainer: Andrew Mello <andrew@88plug.com>
pkgname=rpc-go-bin
pkgver=2.50.6
pkgrel=1
pkgdesc="Intel AMT management CLI — activate, configure, and query AMT/vPro via /dev/mei0 or network"
arch=('x86_64')
url="https://github.com/device-management-toolkit/rpc-go"
license=('Apache-2.0')
depends=()
provides=('rpc-go')
conflicts=('rpc-go')
options=('!strip')
source_x86_64=("rpc_linux_x64-${pkgver}.tar.gz::https://github.com/device-management-toolkit/rpc-go/releases/download/v${pkgver}/rpc_linux_x64.tar.gz")
sha256sums_x86_64=('4e59da6a712df12ed4198087751b87218d2187705adfc6b59725eebef03666f9')

package() {
    install -Dm755 "$srcdir/rpc_linux_x64" "$pkgdir/usr/bin/rpc"
}
