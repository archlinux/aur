# Maintainer: ssfdust <ssfdust@gmail.com>
pkgname=pkgparser
pkgver=v0.00
pkgrel=1
pkgdesc="A simple tool to parse pacman output into a dialog"
arch=('any')
url="https://github.com/ssfdust/pkgparser"
license=('GPL')
depends=('dialog' 'xclip')
optdepends=('xsel')
provides=('pkgparser')
conflicts=('pkgparser')
source=("https://github.com/ssfdust/pkgparser/releases/download/v0.00/pkgparser")
md5sums=('ea303ebabc9624796c81ad40fdde6f2f')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install pkgparser "$pkgdir/usr/bin"
}
