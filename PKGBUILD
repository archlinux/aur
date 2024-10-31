# Maintainer: Slava Ganzin <slava.ganzin@gmail.com>

pkgname=await
pkgver=1.0.7
pkgrel=1
pkgdesc="28kb small memory footprint single binary that run list of commands in parallel and waits for their termination"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('wget' 'tar')
url="https://await-cli.app/"
license=('MIT')
source=(https://github.com/slavaGanzin/await/releases/download/1.0.7/await-1.0.7-x86_64-unknown-linux-gnu.tar.gz)
sha256sums=('SKIP')
provides=('await')
conflicts=('await')

package() {
  msg2 'Installing executables...'
  install -Dm 755 await -t "$pkgdir"/usr/bin
}
