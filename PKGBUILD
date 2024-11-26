# Maintainer: Shadow Wizard Money Gang <test@example.org>

pkgname="q2tools-220-bin"
_pkgver='01-30-24'
pkgver='240130'
pkgrel='1'
pkgdesc='Quake II (Quake 2) BSP map compiler tools with v220 map support'
arch=('x86_64')
url="https://github.com/qbism/q2tools-220"
source=("$url/releases/download/$_pkgver/q2tool-release-$_pkgver.zip")
sha256sums=('5d4c93add748817e96e9f66b8735d7b892c60c47db755ed8097ecf6615d0020b')
license=('GPL-2.0-only')

package() {
  install -D -m755 "$srcdir/Linux64/q2tool" "$pkgdir/usr/bin/q2tool"
  install -D -m644 "$srcdir/README.md" "$pkgdir/usr/share/doc/q2tools-220/README.md"
}
