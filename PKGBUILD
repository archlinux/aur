# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=archlinux-backup-tool
pkgver=1.1.1
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
sha512sums=('5cdb0503fde40e2f5e1ad1ffe09ed402f96c5a7f96008a4590711a983b02781103c41592d0d090c209e53bb8f41eb11a6d6d685680153ca56c24641e4c2ed15b')
