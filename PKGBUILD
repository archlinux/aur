# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='ptyspawn-bin'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='Tool for executing a command in a new PTY (pseudo-terminal) with new PGID and SID'
arch=("x86_64")
url='https://github.com/VHSgunzo/ptyspawn'
source=("${pkgname}::https://github.com/VHSgunzo/${pkgname}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('SKIP')

package() { install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}" ; }
