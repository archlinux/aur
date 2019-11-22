# Maintainer: skuroedov <skuroedov@email.cz>

pkgname=arduino-pro-ide
pkgver=0.0.2
pkgrel=1
pkgdesc="IDE for Arduino development."
arch=('x86_64')
depends=('wget' 'tar')
url="https://github.com/arduino/arduino-pro-ide"
license=('EPLv2')

options=(!strip)

package() {
	wget -O arduino-pro-ide.tar.xz https://downloads.arduino.cc/arduino-pro-ide/arduino-pro-ide-0.0.2-alpha.preview-linux64.tar.xz
	tar -xvf arduino-pro-ide.tar.xz
	mkdir /opt/arudino-pro-ide
	mv Arduino\ Pro\ IDE-v0.0.2-linux/* /opt/arduino-pro-ide
	ln -s /opt/arduino-pro-ide/arudino.pro.ide /usr/bin/arduino-pro-ide
}
