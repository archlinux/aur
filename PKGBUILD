# Maintainer: Benjamin Barbe <ben dot barbe10 at gmail dot com>
pkgname=katana-mk1-fxfloorboard-bin
pkgver=20240118
pkgrel=1
pkgdesc="Editing software for the Boss Katana MK1 guitar modelling and effects amplifier."
arch=('x86_64')
url="https://sourceforge.net/projects/fxfloorboard/files/KatanaFxFloorBoard/Katana%20FxFloorBoard%20for%20MK1%20Desktop/"
license=('GPL3')
provides=("$pkgname")
source=("https://sourceforge.net/projects/fxfloorboard/files/KatanaFxFloorBoard/Katana%20FxFloorBoard%20for%20MK1%20Desktop/Katana_Mk1_FxFloorBoard_FW4_linux.tar.xz/download"
	"Katana-Mk1-FxFloorBoard"
	"Katana-Mk1-FxFloorBoard.desktop")
md5sums=('acfbc23704d7fa706c851eb891a2ae83'
	 'd9b142c34850c74843ed08e1de89e700'
	 '9e6b3ada8f0b23f0649817c4a86de219') 

package() { 
    mkdir -p "${pkgdir}"/opt/
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/applications/
    cp -r Katana_Mk1_FxFloorBoard-linux "${pkgdir}"/opt/Katana_Mk1_FxFloorBoard
    cp Katana-Mk1-FxFloorBoard "${pkgdir}"/usr/bin/Katana-Mk1-FxFloorBoard
    cp Katana-Mk1-FxFloorBoard.desktop "${pkgdir}"/usr/share/applications/Katana-Mk1-FxFloorBoard.desktop
}
