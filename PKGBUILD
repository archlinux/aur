# Maintainer: Gökhan Altun <mail.gokhan52@gmail.com>

pkgname=easy-btrfs
pkgver=1.1.3
pkgrel=2
pkgdesc="A user-friendly Btrfs CLI tool for managing snapshots"
arch=('x86_64')
url="https://github.com/gokhanaltun/easy-btrfs"
license=('MIT')
depends=('btrfs-progs')
source=("https://github.com/gokhanaltun/easy-btrfs/releases/download/v$pkgver/ebtrfs")
sha256sums=('07ee1607f2776f469edcc07b0e2a1a5ba8ae7e520401744e3a97e55175975b7f')

package() {
  install -Dm755 "$srcdir/ebtrfs" "$pkgdir/usr/bin/ebtrfs"
}
