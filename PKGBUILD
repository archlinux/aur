# Maintainer: <aur at felixschindler dot net>

pkgname=reload-wacom-after-suspend
pkgver=0.1
pkgrel=1
pkgdesc="Reloads the wacom kernel module after suspend"
arch=('any')
url="https://wiki.archlinux.org/index.php/Lenovo_ThinkPad_X390_Yoga#Fix_touchscreen_after_resume"
source=(10-wacom.sh)

prepare() {
    echo "nothing to prepare ..."
}

build() {
    echo "nothing to build ..."
}

package() {
    install -D -o root -g root -m 755 10-wacom.sh "${pkgdir}"/usr/lib/systemd/system-sleep/10-wacom.sh
}
md5sums=('adc3f8a2be01b081b75ad5bcaca9bde1')
