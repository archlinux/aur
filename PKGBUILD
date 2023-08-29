# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=rspnvpk
pkgname=$_pkgname-bin
pkgver=1.2.9
pkgrel=2
pkgdesc="RSPNVPK is a command line VPK repacking tool for Titanfall 2 (binary release)"
arch=('x86_64')
url="https://github.com/taskinoz/RSPNVPK"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
options=(!strip)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/taskinoz/RSPNVPK/releases/download/v$pkgver/linux-x64.tar.gz")
sha256sums=('a1af5b33368af22acb31e5c7908a3e1f68c1d52c166310b82635045a7d9a5493')

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/RSPNVPK" "$pkgdir/usr/bin"
  # Install
  mv LzhamWrapper.pdb RSPNVPK RSPNVPK.pdb "$pkgdir/opt/RSPNVPK"
  ln -s /opt/RSPNVPK/RSPNVPK "$pkgdir/usr/bin/$_pkgname"
}
