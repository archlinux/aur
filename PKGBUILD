# Maintainer: Melorise <0d00@0721.hk>
pkgname=spark-winfonts
pkgver=1.4
pkgrel=2
pkgdesc="Fonts in Windows and MS Office, comes from spark-store"
arch=('any')
license=('custom')
depends=('fontconfig')
source=("https://mirrors.sdu.edu.cn/spark-store/amd64-store/themes/winfonts/winfonts_1.4_all.deb")
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
