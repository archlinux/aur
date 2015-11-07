# Maintainer: Wojtek Gawroński <afronski@gmail.com>
# https://github.com/afronski/aur-packages/tree/master/aur/nomad-bin

pkgname=nomad-bin
pkgver=0.1.2
pkgrel=0
epoch=
pkgdesc="Easily deploy applications at any scale - A Distributed, Highly Available, Datacenter-Aware Scheduler"
arch=('i686' 'x86_64')
url="https://nomadproject.io/"
license=('MPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('nomad')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source_i686=("https://dl.bintray.com/mitchellh/nomad/nomad_0.1.2_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/nomad/nomad_0.1.2_linux_amd64.zip")

sha256sums_i686=('8f683ad738a0b141b6cda111b38ec51e2d87da82c61e734a37b5e5e998d2e1e8')
sha256sums_x86_64=('3335f7acb0d5eacaaa19aea37d128418ace18e6ef03d38de0c2c52ce831d7934')

noextract=()

package() {
	install -Dm0755 nomad "$pkgdir/usr/bin/nomad"
}