# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=wowlet-bin
_pkg=wowlet
pkgver=4.0.0
pkgrel=1
pkgdesc="A free Wownero desktop wallet"
url="https://git.wownero.com"
arch=('x86_64')
license=('custom')
source=("$_pkg-v$pkgver-$arch-linux.zip::$url/attachments/2ed9abc2-3e71-4251-8b19-75b676cfc8a7")
sha512sums=('4341aa304ccfa51ec7568e68866c8152b63751a21ac4a912f1e79cc02567dbbe921314b9d4193d9b652292ede453aabf00ad9ca1dc38ba3763cbb35ffbf020e9')

package() {
  install -Dm755 "${srcdir}/$_pkg" "$pkgdir/opt/${_pkg}/$_pkg"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/$_pkg "${pkgdir}/usr/bin"
}
