# Maintainer: Wojtek Gawroński <afronski@gmail.com>
# https://github.com/afronski/aur-packages/tree/master/aur/nomad-bin

pkgname=nomad-bin
pkgver=0.5.2
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

source_i686=("https://releases.hashicorp.com/nomad/0.5.2/nomad_0.5.2_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/nomad/0.5.2/nomad_0.5.2_linux_amd64.zip")

sha256sums_i686=('8e426c541d1381aec16f435083fde96bff7238a5a546bd64cea317bdf99a4919')
sha256sums_x86_64=('7f23aa44686b2ae505ecfc5364a43f87c2a029ea03f6ab050384f2a2b32ac648')

noextract=()

package() {
	install -Dm0755 nomad "$pkgdir/usr/bin/nomad"
}