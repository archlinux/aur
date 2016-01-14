# Maintainer: Jordan Klassen <forivall@gmail.com>
# https://github.com/forivall/aur-packages/tree/master/aur/otto-bin
pkgname=otto-bin
pkgver=0.2.0
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

source_i686=("https://releases.hashicorp.com/otto/${pkgver}/otto_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/otto/${pkgver}/otto_${pkgver}_linux_amd64.zip")
source_arm=("https://releases.hashicorp.com/otto/${pkgver}/otto_${pkgver}_linux_arm.zip")

sha256sums_i686=('ffd83f915f8c516a52ba298db1c0f31de927a136248a9d946ee0055caae67f0d')
sha256sums_x86_64=('4877972a8b8bafdb2acd9958c77f31a983b8fa292f5c3509f12a2361cd4307cd')
sha256sums_arm=('5fb183858713eb31f2e022f945a3055b992970ff9d2291cce9b965bbb15f3ca8')

noextract=()

package() {
	install -Dm0755 otto "$pkgdir/usr/bin/otto"
}
