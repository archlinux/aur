# Maintainer: Aniket-Pradhan aniket17133 [at] iiitd [dot] ac [dot] in
# Creator: Aniket-Pradhan

pkgname=lsd-sim
pkgver=1.0.0
pkgrel=1
pkgdesc="A Cheap Psychedelic Simulator on Linux"
arch=('i686' 'x86_64')
source=(lsd::git+https://github.com/Aniket-Pradhan/lsd#tag=1.0.0)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/lsd/lsd"
}

md5sums=(SKIP)
