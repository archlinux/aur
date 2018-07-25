# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=archlinux-backup-tool
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="A simple shell script to backup and restore your AL installation."
arch=(any)
url="https://gitlab.com/Myl0g/archlinux-backup-tool"
license=('GPL')
depends=('rsync'
	 'pv' 
	 'bash' 
	 'pacman')
optdepends=('yaourt: a common AUR helper')
source=("https://gitlab.com/Myl0g/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
	install -d "${pkgdir}/usr/bin"
	mv "${pkgname}-${pkgver}/${pkgname%-tool}.sh" "${pkgdir}/usr/bin/${pkgname%-tool}"
	chmod 755 "${pkgdir}/usr/bin/${pkgname%-tool}"
}
sha512sums=('86cfcd6bbe7efe3e46ca6f87730079e3202b0fbc12e6ec889f9ddb084e4e23afb7b2ad01ec33041b6b150bdf110ae796aa9fd2523accb0bb886085e6b745afc1')
