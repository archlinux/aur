# Maintainer: Your Name <youremail@domain.com>
pkgname=isomount
pkgver=0.1
pkgrel=1
arch=('any')
pkgdesc="Mount ISOs simple over dolphin and userspace"
license=('GPL')
depends=(fuseiso)
makedepends=(git)
source=("src.tar.gz")
sha256sums=('3e4654b19a8fd793d1353016f168ef34ea3f4888d591baae48d647fb885eb75e')

package() {
install -Dm1600 "${srcdir}/.local/share/kservices5/ServiceMenus/mount-iso.desktop" ~/.local/share/kservices5/ServiceMenus/
install -Dm0755 "${srcdir}/.local/bin/isomount.sh" ~/.local/bin/isomount
}
