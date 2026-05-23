# Maintainer: Your Name <your-email at domain dot tld>
pkgname=kubit-cli-bin
pkgver=0.3.82
pkgrel=1
pkgdesc="CLI tool to interact with Pack and other Kubernetes resources"
arch=('x86_64')
url="https://kubit.cloud"
license=('custom:Proprietary')
provides=('kubit-cli')
conflicts=('kubit-cli')
options=('!strip')
source_x86_64=("https://kubit.cloud/download/kubit")
sha512sums_x86_64=('97c89c97776ae29ca97e5e10d34ea6ef24df9242fe2318c54b1b7aa5ba16215c41e2c6e58aa6eda224b6f3de5d692a14aa8943a7177f45a53e19f56f8832a588')

package() {
	install -Dm755 "$srcdir/kubit" "$pkgdir/usr/bin/kubit"
}