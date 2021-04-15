# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=megacubo
pkgver=16.1.3
pkgrel=1
pkgdesc="An intuitive, free and open source IPTV player."
url="https://github.com/efoxbr/megacubo"
license=('GPL-3')
depends=("libxss" "libxtst" "libappindicator-gtk2" "gconf-gtk2" "libnotify")
provides=("${pkgname}")
arch=('x86_64' 'i686')
source_x86_64=("https://github.com/efoxbr/megacubo/releases/download/v${pkgver}/Megacubo_${pkgver}_linux_x64.tar.gz"
"${pkgname}.desktop"
 )
 source_i686=("https://github.com/efoxbr/megacubo/releases/download/v${pkgver}/Megacubo_${pkgver}_linux_ia32.tar.gz"
 "${pkgname}.desktop"
 )

package() {
	
	mkdir -p ${pkgdir}/opt/$pkgname
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/icons/
	tar -xf ${srcdir}/Megacubo_${pkgver}_linux_*.tar.gz -C ${pkgdir}/opt/$pkgname
	mv -uf $pkgname.desktop ${pkgdir}/usr/share/applications/
	cp ${pkgdir}/opt/megacubo/package.nw/default_icon.png ${pkgdir}/usr/share/icons/megacubo.png
	
}
sha512sums_x86_64=('a3bf664f3489084a4af252223a2dbe3b0274c6cb795993c3042473499f1814201efd48a2cbe18ecc070423d02b05e6c1e60a1f4a2fba28eb8a913542b0d11f33'
                   'bb8349eca81bc6ebfb3c1af12a8ab11b0a6a00faf462485849375089d462380ffceb4b1e87451ead786b33a934dc8cd6a4b89d92b889284a3c63d3e30d81127a')
sha512sums_i686=('b68916dda1666950fc25834713c882657c8ce77984b5f0841236b581bf7969ca16906f82a7b4778353441b62bb9e92aa23ba1afad97cb572a3371caf9950a7c9'
                 'bb8349eca81bc6ebfb3c1af12a8ab11b0a6a00faf462485849375089d462380ffceb4b1e87451ead786b33a934dc8cd6a4b89d92b889284a3c63d3e30d81127a')

