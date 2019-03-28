# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=ipfs-fuse-daemon
pkgver=0.0.1
pkgrel=1
pkgdesc="systemd daemon to mount ipfs as a fuse"
url=https://github.com/KSXGitHub/ipfs-fuse-daemon.pkgbuild
arch=(any)
license=(MIT)
depends=(bash go-ipfs fuse2)
source=(start-ipfs-fuse-daemon.sh ipfs-fuse.service LICENSE.md)
sha512sums=(SKIP SKIP SKIP)

package() {
  install -Dm755 start-ipfs-fuse-daemon.sh "$pkgdir"/usr/bin/start-ipfs-fuse-daemon.sh
  install -Dm644 ipfs-fuse.service "$pkgdir"/usr/lib/systemd/user/ipfs-fuse.service
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
