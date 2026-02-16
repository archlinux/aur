# Maintainer: NorthWestWind <wsyn148@gmail.com>
_pkgname=ntrviewer-hr
pkgname=$_pkgname-lite-bin
pkgver=0.3.7.0
pkgrel=1
pkgdesc="Viewer for wireless screen casting from New 3DS/New 2DS to PC (Lite version)"
arch=("x86_64")
url="https://github.com/xzn/ntrviewer-hr"
license=('MIT')
source=("$url/releases/download/v$pkgver/NTRViewer-HR-Lite-Linux-x64.tar.gz")
sha256sums=("070dc0fed186c1b34066839d41e401bf2ec7bcf004180c432ad76be5493296ce")

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/NTRViewer-HR-Lite-Linux-x64/ntrviewer"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/NTRViewer-HR-Lite-Linux-x64/ntrviewer-x11.sh"
}
