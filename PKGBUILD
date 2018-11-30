# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('t2ec')
pkgver=0.2
pkgrel=5
pkgdesc="A package of scripts to display system icons and controls in Tint2 panel"
arch=('x86_64')
url="https://github.com/nwg-piotr/tint2-executors"
license=('GPL3')
depends=('python' 'acpi' 'xorg-xbacklight' 'alsa-utils' 'wireless_tools')
optdepends=('light-git: for machines not handling xbacklight'
	    'rof-git: for running mouse events commands as single instances'
	    'zenity: for volume and brightness slider box'
	    'jgmenu: to attach menus to icons')

source=("https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/battery-icon.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/bbswitch-status-temp.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/brightness-icon-light.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/brightness-icon.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/desktop.py"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/volume-icon.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/wifi-name.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/arch-update.py"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/zenity-box.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/help.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/menu-template.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/menu-update.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/arch-package/t2ec-lib/menus.sh"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-empty-charging.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-empty.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-full-charging.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-full.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-half-charging.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-half.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-quarter-charging.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-quarter.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-threefourth-charging.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bat-threefourth.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bri-full.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bri-high.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bri-low.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/bri-medium.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/desktop.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/network.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/no-bumblebee.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/nvidia-off.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/nvidia.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/vol-full.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/vol-low.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/vol-lowest.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/vol-medium.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/vol-muted.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/arch-icon.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/arch-icon-notify.svg"
	"https://github.com/nwg-piotr/tint2-executors/raw/master/images/arch-update48.svg")

md5sums=('df88efa83e480abb9029028a09c9d1a2'
         'b86f03023ea9a927c90a50e12c51d05b'
         '921064d0eb82b775080872a5507e820d'
         '1dae806f7c7b0eb34cda8468b4631474'
         '87b0cfeab8a467db470922e60a6ec187'
         '77a867395a44bdfc94b3d93dfa5d0d1a'
         '63a955c04f03451a13fd4a5f3ea1bbf3'
         '4d5efb2581959b68db65a0964e1c26b9'
         '607482e19bdcd53454b4e2b077760ef8'
         'f9a82c34f8f4228c5dc194b0fb7b37a0'
         '36418d374a2cf33abba5e40915d0911e'
         'a44810558d11b2a695e7fde1baf5dc8a'
         '80dc7aef3a27d256676857b6ae925a2a'
         '81c7f9f8c45544cc66d8e0d8fa10bee9'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  install -D -m 755 t2ec \
 	 "$pkgdir"/usr/bin/t2ec
  install -D -m 755 battery-icon.sh \
 	 "$pkgdir"/usr/lib/$pkgname/battery-icon.sh
  install -D -m 755 bbswitch-status-temp.sh \
 	 "$pkgdir"/usr/lib/$pkgname/bbswitch-status-temp.sh
  install -D -m 755 brightness-icon-light.sh \
 	 "$pkgdir"/usr/lib/$pkgname/brightness-icon-light.sh
  install -D -m 755 brightness-icon.sh \
 	 "$pkgdir"/usr/lib/$pkgname/brightness-icon.sh
  install -D -m 755 desktop.py \
 	 "$pkgdir"/usr/lib/$pkgname/desktop.py
  install -D -m 755 volume-icon.sh \
 	 "$pkgdir"/usr/lib/$pkgname/volume-icon.sh
  install -D -m 755 wifi-name.sh \
 	 "$pkgdir"/usr/lib/$pkgname/wifi-name.sh
  install -D -m 755 arch-update.py \
 	 "$pkgdir"/usr/lib/$pkgname/arch-update.py
  install -D -m 755 zenity-box.sh \
 	 "$pkgdir"/usr/lib/$pkgname/zenity-box.sh
  install -D -m 755 help.sh \
 	 "$pkgdir"/usr/lib/$pkgname/help.sh
  install -D -m 755 menu-template.sh \
 	 "$pkgdir"/usr/lib/$pkgname/menu-template.sh
  install -D -m 755 menu-update.sh \
 	 "$pkgdir"/usr/lib/$pkgname/menu-update.sh
  install -D -m 755 menus.sh \
 	 "$pkgdir"/usr/lib/$pkgname/menus.sh
  install -D -t "$pkgdir/usr/share/$pkgname" *.svg
}
