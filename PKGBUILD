# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=archlinux-backup-tool
pkgver=1.0.1
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
sha512sums=('f1c169b6e597b91633b0de173d0474de9539bd607fc8bede1f7c978df7dec25ad03d8e72ba74e99d5f1d10b966ccbe9023580231442283a43f8923706ed55803')
