# Maintainer: Meade Kincke <thedarkula2049@gmail.com>
pkgname=rustup-official
pkgver=1.0.0
pkgrel=2
pkgdesc='Tells pacman that you have rustup, rust, and cargo installed if you installed rustup via rustup.rs.'
arch=('x86_64')
license=('AGPL3')
provides=('cargo' 'rust' 'rustup')
source=('https://www.gnu.org/licenses/agpl-3.0.txt')
md5sums=('eb1e647870add0502f8f010b19de32af')

package() {
  install -D -m644 agpl-3.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 

