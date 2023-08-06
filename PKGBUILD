# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='ptyspawn-bin'
pkgver='0.0.5'
pkgrel='1'
pkgdesc='Tool for executing a command in a new PTY (pseudo-terminal) with new PGID and SID'
arch=("x86_64")
url='https://github.com/VHSgunzo/ptyspawn'
source=("${pkgname%-bin}::https://github.com/VHSgunzo/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}" ; }
