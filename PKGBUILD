## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=libsgllnx
pkgver=2.29.02
_debpkgver=4.31.0-131
pkgrel=1
pkgdesc="HQPlayer additional library"
url="http://www.signalyst.com/custom.html"
arch=('x86_64' 'aarch64')
license=('custom')
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/focal/hqplayerd_"$_debpkgver"_amd64.deb")
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/bullseye/hqplayerd_"$_debpkgverarm"_arm64.deb")
sha256sums_x86_64=('b211c3259ecf350484dfa9fdcc3f57187695eeb26992f0f3e3ceeeffa79029e7')
sha256sums_aarch64=('72dd6327d143c59b8c3f8b62281d13a4777b18603ff5164ee73ca864cfd54974')

package() {
  cd "$srcdir"
  bsdtar xf data.tar.xz
  install -Dm755 "$srcdir/opt/hqplayerd/lib/libsgllnx64-2.29.02.so" "$pkgdir/usr/lib/libsgllnx64-2.29.02.so"
}
