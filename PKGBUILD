pkgname=libeventemitter-nightly
pkgver=nightly_2025_11_22_02_45_48_PM
pkgrel=1
pkgdesc='A Lightweight, NTS, C Event Emitter Library'
arch=('x86_64')
license=('BSD-3')
url='https://github.com/LesBoys43/libeventemitter.git'
source=("https://github.com/LesBoys43/libeventemitter/releases/download/nightly_2025_11_22_02_45_48_PM/libeventemitter_nightly_2025_11_22_02_45_48_PM.7z")
makedepends=("7zip")
depends=("glib2")

package(){
  cd "$srcdir"
  7z x *.7z -o$pkgdir
}