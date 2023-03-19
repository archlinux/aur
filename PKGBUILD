# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=wowlet-bin
_pkg=wowlet
pkgver=3.2.0
pkgrel=1
pkgdesc="A free Wownero desktop wallet"
url="https://git.wownero.com"
arch=('x86_64')
license=('custom')
source=("$_pkg-v$pkgver-$arch-linux.zip::$url/attachments/53d14db5-cbc4-450f-a1c6-1078659bf819")
sha512sums=('0d61f6187a63a505a4354991e5f62e6d8fd2082a208e90378a5761328aec4b63df566469c174364bb8e66a99ee8a8816c9a8a0aa6dc04ce6c8e64a17e466f63a')

package() {
  install -Dm755 "${srcdir}/$_pkg" "$pkgdir/opt/${_pkg}/$_pkg"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/$_pkg "${pkgdir}/usr/bin"
}
