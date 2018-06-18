# Maintainer: Caleb Woodbine <gitlab.com/BobyMCbobs>
pkgname=rpicustomiser
pkgver=1.0.1
pkgrel=1
pkgdesc="A useful tool for customising Rasbian. Chroot, install deb packages, copy files, customise."
arch=('any')
url="https://gitlab.com/BobyMCbobs/${pkgname}"
license=('GPL')
depends=('bash' 'qemu' 'qemu-user-static' 'binfmt-support')
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('7c0526112a5cfce616cadaff345d236c')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
