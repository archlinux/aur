# Maintainer: Wojtek Gawroński <afronski@gmail.com>
# https://github.com/afronski/aur-packages/tree/master/aur/nomad-bin

pkgname=nomad-bin
pkgver=0.6.3
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

source_i686=("https://releases.hashicorp.com/nomad/0.6.3/nomad_0.6.3_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/nomad/0.6.3/nomad_0.6.3_linux_amd64.zip")

sha256sums_i686=('517e5585ddc5bdeb3eb75e12a95d0f61977f2d0943f61243966afb3d1767d028')
sha256sums_x86_64=('908ee049bda380dc931be2c8dc905e41b58e59f68715dce896d69417381b1f4e')

noextract=()

package() {
	install -Dm0755 nomad "$pkgdir/usr/bin/nomad"
}