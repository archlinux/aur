# Maintainer: Wojtek Gawroński <afronski@gmail.com>
# https://github.com/afronski/aur-packages/tree/master/aur/nomad-bin

pkgname=nomad-bin
pkgver=0.2.3
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

source_i686=("https://releases.hashicorp.com/nomad/0.2.3/nomad_0.2.3_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/nomad/0.2.3/nomad_0.2.3_linux_amd64.zip")

sha256sums_i686=('0966b354b9b4a2ead44f2528b02b98b2bd731c0f80dc8eb7e7776cae59be175b')
sha256sums_x86_64=('0f3a7083d160893a291b5f8b4359683c2df7991fa0a3e969f8785ddb40332a8c')

noextract=()

package() {
	install -Dm0755 nomad "$pkgdir/usr/bin/nomad"
}