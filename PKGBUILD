# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=otto-bin
pkgver=0.1.1
pkgrel=2
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

sha256sums_i686=('4430fc1e6c3dce5048a2d9ae8a897feab1209b1a4d33ee97d233cb2f5ae60943')
sha256sums_x86_64=('6e36a81b896881aec9a4169140821ed36ff4e2757095dbe28c1961ee7ea72513')
sha256sums_arm=('abc5cce40777cad937ddfdf11dd706d62e321c492cd1a589060ccb6b4a12a5bc')

noextract=()

package() {
	install -Dm0755 otto "$pkgdir/usr/bin/otto"
}
