# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=archlinux-backup-tool
pkgver=1.3
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
sha512sums=('f927689a26f03dfcce59a662988dd0fc03e24e9770ba112644871bdd2a39355298899e8cf359d0cb9f5a19b94b23bc090d14af9adee76ff5e79e49100a0928aa')
