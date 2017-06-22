# Maintainer: Wojtek Gawroński <afronski@gmail.com>
# https://github.com/afronski/aur-packages/tree/master/aur/nomad-bin

pkgname=nomad-bin
pkgver=0.5.6
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

source_i686=("https://releases.hashicorp.com/nomad/0.5.6/nomad_0.5.6_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/nomad/0.5.6/nomad_0.5.6_linux_amd64.zip")

sha256sums_i686=('5ec9d890ffa8ca338d53b3aeeab793dd1acef0670b381adcc04806c059ff5369')
sha256sums_x86_64=('3f5210f0bcddf04e2cc04b14a866df1614b71028863fe17bcdc8585488f8cb0c')

noextract=()

package() {
	install -Dm0755 nomad "$pkgdir/usr/bin/nomad"
}