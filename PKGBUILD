# Maintainer: David Pedersen <limero@me.com>
pkgname=wowmatrix
pkgver=1
pkgrel=1
pkgdesc="WowMatrix is a 100% FREE WoW AddOn Installer and Updater"
arch=('i686' 'x86_64')
url="https://www.wowmatrix.com/"
license=('custom')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname.desktop" "$pkgname.png")
source_i686=("http://swupdate.wowmatrix.com/linux/wowmatrix32.tar.gz")
source_x86_64=("http://swupdate.wowmatrix.com/linux/wowmatrix.tar.gz")
md5sums=('cd53cc6f306dbd734dcb76ac064c96c1' '8575a4076ceb1ab6c1808272505f36ae')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
