# Maintainer: Wayne Hartmann (DH4) <wayne@bitstorm.pw>

pkgname=yumi-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="YUMI (Your Universal Multiboot Integrator), is the successor to 
our MultibootISOs. It can be used to create a Multiboot USB Flash Drive 
containing multiple operating systems, antivirus utilities, disc 
cloning, diagnostic tools, and more."
arch=('i686' 'x86_64')
url="http://www.pendrivelinux.com/yumi-multiboot-usb-creator/"
license=('GPL')
depends=('gambas3-runtime' 'gambas3-gb-image' 'gambas3-gb-gtk' 
'gambas3-gb-form')
source=('http://www.pendrivelinux.com/downloads/YUMI/ubuntu/yumi_0.0.1-1_all.deb')
md5sums=('9b50f2c3d72c978beaa0c1707a3d8d24')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}

