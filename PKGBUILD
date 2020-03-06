 # Maintainer: yjun <jerrysteve1101@gmail.com>
 pkgname=zhumu
 pkgver=2.5.361956.0302
 _pkgdate=20200306
 pkgrel=1	
 pkgdesc="Video Conferencing and Web Conferencing Service"
 arch=("x86_64")
 url="https://www.zhumu.me"
 license=('custom:zhumu')
 depends=('libxcb' 'libpulse' 'libxcomposite' 'libxslt' 'sqlite' 'dbus' 'libxrender' 'libsm' 'libxi' 'fontconfig')
 source=("http://downloads.zhumu.me/client/latest/linux/${pkgname}_${pkgver}_amd64.deb")
 md5sums=('a7ac2cac1630e725ac564f67a30b5c4d')
 package(){
	cd ${srcdir}
	
	tar -xJf data.tar.xz -C ${pkgdir}
	
	#fix icon display
	sed -i 's/Icon=Zhumu.png/Icon=Zhumu/g' ${pkgdir}/usr/share/applications/Zhumu.desktop
 }
