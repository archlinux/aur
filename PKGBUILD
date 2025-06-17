# Maintainer: Gökhan Altun <mail.gokhan52@gmail.com>

pkgname=easy-btrfs
pkgver=1.1.2
pkgrel=1
pkgdesc="A user-friendly Btrfs CLI tool for managing snapshots"
arch=('x86_64')
url="https://github.com/gokhanaltun/easy-btrfs"
license=('MIT')
depends=('btrfs-progs')
source=("https://github.com/gokhanaltun/easy-btrfs/releases/download/v$pkgver/ebtrfs")
sha256sums=('e6ec4a65e1724e1dabde8bde5e2eed9754d80800a406e88df65029d48b6b7200')

package() {
  install -Dm755 "$srcdir/ebtrfs" "$pkgdir/usr/bin/ebtrfs"
}
