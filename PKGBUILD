# Maintainer: Tyler Gautney <tgautney49@codedragon.dev>

pkgname=simpleide-amd64-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="SimpleIDE for Parallax Activity board"
arch=("x86_64")
url="https://www.parallax.com/package/simpleide-software-for-linux-propeller-c/"
license=("MIT")
groups=("base-devel")
depends=('libftdi' 'ctags' 'audiofile' 'qt4')
source=("https://www.parallax.com/package/simpleide-software-for-linux-propeller-c/?ind=1600713241394&filename=simple-ide_1-0-1-rc1_amd64.deb&wpdmdl=3349&refresh=5fd93816736d71608071190")
md5sums=("70cbb0407153abd5e8d6f00a9c093e3e")
package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
