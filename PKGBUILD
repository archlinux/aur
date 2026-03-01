# Maintainer: KafuuNagi <welcome-come-on@outlook.com>
pkgname=spark-winfonts
pkgver=1.4
pkgrel=1
pkgdesc="Fonts in Windows and MS Office, comes from spark-store"
arch=('any')
license=('custom')
depends=('fontconfig')
source=("https://mirrors.sdu.edu.cn/spark-store/amd64-store/others/winfonts/winfonts_1.4_all.deb")
md5sums=('SKIP')

package() {
  bsdtar -xzf data.tar.xz -C "$pkgdir"
}

post_install() {
  fc-cache -fv
}

post_upgrade() {
  post_install
}

post_remove() {
  fc-cache -fv
}
