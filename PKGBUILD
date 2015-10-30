# Maintainer: Jordan Klassen <forivall@gmail.com>
# https://github.com/forivall/aur-packages/tree/master/aur/otto-bin
pkgname=otto-bin
pkgver=0.1.2
pkgrel=0
epoch=
pkgdesc="Development and Deployment Made Easy - The Successor to Vagrant"
arch=('i686' 'x86_64' 'arm')
url="https://ottoproject.io/"
license=('MPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('otto')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source_i686=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_amd64.zip")
source_arm=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_arm.zip")

sha256sums_i686=('f55988a9b25575303632c69ce0f49ac13e9885fb5ed1fa3af2767270736100b2')
sha256sums_x86_64=('e09bc9ca8c978b589170ac16f3b5803966f699fb2578d58d65b0bfe1844e0404')
sha256sums_arm=('7a97041405b6cc4dbd24742a771e1e730c49c708b2baa27b83085d78e7f6b079')

noextract=()

package() {
	install -Dm0755 otto "$pkgdir/usr/bin/otto"
}
