# Maintainer: XXiaoA <isxxiaoa@gmail.com>

pkgname=xdm
pkgver=0.4.1
pkgrel=1
pkgdesc="XXiaoA's dotfiles manager"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/XXiaoA/xdm"
license=("GPL3")
provides=("xdm")
source=("https://github.com/XXiaoA/xdm/releases/download/$pkgver/xdm-x86_64-unknown-linux-gnu.tar.gz"
       "LICENSE::https://raw.githubusercontent.com/XXiaoA/xdm/main/LICENSE")
sha1sums=("ce943cf077d18a74b1f79a850f3937ceb7b5650d"
          "SKIP")

package() {
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}
