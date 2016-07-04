# Maintainer: Wojtek Gawroński <afronski@gmail.com>
# https://github.com/afronski/aur-packages/tree/master/aur/nomad-bin

pkgname=nomad-bin
pkgver=0.4.0
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

source_i686=("https://releases.hashicorp.com/nomad/0.4.0/nomad_0.4.0_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/nomad/0.4.0/nomad_0.4.0_linux_amd64.zip")

sha256sums_i686=('0f3a7083d160893a291b5f8b4359683c2df7991fa0a3e969f8785ddb40332a8c')
sha256sums_x86_64=('c0479dcc03d35c1b0f6e7be256732431384bec16901a124dd97b2a60d465fb91')

noextract=()

package() {
	install -Dm0755 nomad "$pkgdir/usr/bin/nomad"
}