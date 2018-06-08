# Maintainer: Caleb Woodbine <github.com/BobyMCbobs>
pkgname=rpicustomiser
pkgver=1.0.1
pkgrel=1
pkgdesc="A useful tool for customising Rasbian. Chroot, install deb packages, copy files, customise."
arch=('any')
url="https://gitlab.com/BobyMCbobs/${rpicustomiser}"
license=('GPL')
depends=('bash' 'qemu' 'qemu-user-static' 'binfmt-support')
install=
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
noextract=()
md5sums=('SKIP')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
