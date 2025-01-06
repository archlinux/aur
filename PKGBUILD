# Maintainer: levinion <levinnion@gmail.com>
pkgname=nimo-bin
pkgver=0.1.0
pkgrel=2
pkgdesc='a Rust CLI tool to fetch files or directories from GitHub with a single command'
url='https://github.com/levinion/nimo'
source_x86_64=("https://github.com/levinion/nimo/releases/download/v0.1.0/nimo-v0.1.0-x86_64.tar.zst")
arch=('x86_64')
license=('MIT')
depends=('git' 'pacman')
sha256sums_x86_64=('1a2a48db7286f9f06bfb571b7bdcd7701680fd152769042809353033aa45b1c2')

package() {
  cd "$srcdir/"
  install -Dm755 nimo "${pkgdir}/usr/bin/nimo"
}
