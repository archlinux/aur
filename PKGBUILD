# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.2
pkgrel=1
pkgdesc="Bash unique command for mount image files (iso, vms, crypto), detect pendrive device name, list all kernels, list all i/o schedulers."

arch=('any')
license=('GPL3')

depends=('bash')
optdepends=('qemu: for mount qemu image files'
            'fuseiso: another way to mount iso image files'
            'cryptsetup: for mount crypto image files' )

source=($pkgname-$pkgver.tar.gz)
md5sums=('e8e997f96ddb9955545da09d1c76a65f')

package() {
  cd "$srcdir"
  install -Dm 755 "$srcdir/usr/bin/simona-scripts" "$pkgdir/usr/bin/simona-scripts"
  install -Dm 755 "$srcdir/usr/bin/pendrive-detect" "$pkgdir/usr/bin/pendrive-detect"
  install -Dm 755 "$srcdir/usr/bin/image-mount" "$pkgdir/usr/bin/image-mount"
  install -Dm 755 "$srcdir/usr/bin/image-umount" "$pkgdir/usr/bin/image-umount"
  install -Dm 755 "$srcdir/usr/bin/boot-kernel-list" "$pkgdir/usr/bin/boot-kernel-list"
  install -Dm 755 "$srcdir/usr/bin/ioscheduler-list" "$pkgdir/usr/bin/ioscheduler-list"
}



