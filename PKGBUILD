pkgname=libeventemitter-nightly
pkgver=nightly_2026_05_26_05_46_09_PM
pkgrel=1
pkgdesc='A Lightweight, NTS, C Event Emitter Library'
arch=('x86_64')
license=('BSD-3')
url='https://github.com/LesBoys43/libeventemitter.git'
source=("https://github.com/LesBoys43/libeventemitter/releases/download/nightly_2026_05_26_05_46_09_PM/libeventemitter_nightly_2026_05_26_05_46_09_PM.7z")
makedepends=("7zip")
depends=("glib2")

package(){
  cd "$srcdir"
  7z x *.7z -o$pkgdir
}