# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=megasync
pkgver=2.6.1
pkgrel=2
pkgdesc="Sync your files to your Mega account. Official app"
arch=('i686' 'x86_64')
url="https://mega.nz/#sync"
license=('custom:The Clarified Artistic License')
conflicts=('megatools')
depends=('openssl' 'c-ares' 'libgcrypt' 'crypto++' 'qt4' 'libpng' 'qtchooser' 'sqlite')
optdepends=('sni-qt: fix systray issue on KDE and LXQt')
source_i686=("https://mega.nz/linux/MEGAsync/Debian_8.0/i386/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://mega.nz/linux/MEGAsync/Debian_8.0/amd64/${pkgname}_${pkgver}_amd64.deb")
md5sums_i686=('da2babc3c783a7223ec44a6459e38601')
md5sums_x86_64=('1c09492e207def7f1b10f2575cff6f57')
install="${pkgname}.install"
package (){
	cd "${srcdir}"
	pwd
	tar -xvf data.tar.xz -C ${pkgdir}
	rm -r ${pkgdir}/usr/share/doc
}
