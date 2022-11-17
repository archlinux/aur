# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Slava Ganzin <slava.ganzin@gmail.com>
pkgname="strace-grace"
pkgver="0.0.1"
pkgrel=1
pkgdesc="grace is a tool for monitoring and annotating syscalls for a given process.  It's essentially a lightweight strace, in Go, with colours and pretty output."
arch=("any")
url="https://github.com/liamg/grace"
license=("MIT")
provides=("grace")
source=("grace::https://github.com/liamg/grace/releases/download/v$pkgver/grace-linux-amd64")
md5sums=('e3d2cce335e3f0d0551080df61dc2345')


package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  install -m=777 "grace" "${pkgdir}/usr/bin"
}
