# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=otto-bin
pkgver=0.1.0
pkgrel=1
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
sha256sums_i686=("d2de23064d93cd3d3199d208371f9b3184d949961c243d084ff5d7e47019fc7d")

source_x86_64=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=("472ea087c3aca02174edea5dda8e61d7aca680703887d07e566a214b748ebb89")

source_arm=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_arm.zip")
sha256sums_arm=("f3c180a21af9a5037e077f6c984bf5d94a849c2d4d7d7d2655c5f221b92d1b3a")

noextract=()

package() {
	install -D -m 777 otto "$pkgdir/usr/bin/otto"
}
