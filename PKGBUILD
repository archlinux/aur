# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=megasync
pkgver=2.7.1
pkgrel=3.1
pkgdesc="Sync your files to your Mega account. Official app"
arch=('i686' 'x86_64')
url="https://mega.nz/#sync"
license=('custom:The Clarified Artistic License')
conflicts=('megatools')
depends=('openssl' 'c-ares' 'libgcrypt' 'crypto++-562' 'qt4' 'libpng' 'qtchooser' 'sqlite')
optdepends=('sni-qt: fix systray issue on KDE and LXQt')
source_i686=("https://mega.nz/linux/MEGAsync/openSUSE_Tumbleweed/i586/${pkgname}-${pkgver}-${pkgrel}.i586.rpm")
source_x86_64=("https://mega.nz/linux/MEGAsync/openSUSE_Tumbleweed/x86_64/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm")
md5sums_i686=('256feb740117ae064f893c966c7efe00')
md5sums_x86_64=('ed190d8b7cb99ba47fd5b48354c03af0')
install="${pkgname}.install"
package (){
	cd "${srcdir}"
	cp -r usr ${pkgdir}
}
