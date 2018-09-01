# Maintainer: Tinh Truong <xuantinh at gmail dot com>
pkgname=aur-pkg-status
pkgver=0.1.0
pkgrel=1
pkgdesc="A small utility to check the status of the AUR packages installed on your ArchLinux machine"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/tinhtruong/aur-pkg-status/"

source_i686=("https://github.com/tinhtruong/aur-pkg-status/releases/download/v${pkgver}/aur-pkg-status_${pkgver}_linux_i686.tar.gz")
source_x86_64=("https://github.com/tinhtruong/aur-pkg-status/releases/download/v${pkgver}/aur-pkg-status_${pkgver}_linux_x86_64.tar.gz")
sha256sums_i686=('dc1a850e039e859bad8cd0239dbcc89e1cb74b91696fcdc18bcca725307d7e31')
sha256sums_x86_64=('664d6699ff7e0f1a81fd34ab214f6d2c98ae56b72582ae8741a43d17489daa50')

depends=('pacman')

package() {
	install -d "${pkgdir}/usr/bin"
        cp $srcdir/aur-pkg-status "${pkgdir}/usr/bin/aur-pkg-status"
}
