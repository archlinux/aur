# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.1
pkgrel=3
pkgdesc="Bash commands."
#url="https://github.com/simona70/grub-custom-simona"

arch=('any')
license=('GPL2')

depends=('bash')
optdepends=('qemu: for mount qemu image files'
            'fuseiso: another way to mount iso image files'
            'cryptsetup: for mount crypto image files' )

source=($pkgname-$pkgver.tar.gz)
#generate with 'makepkg -g'
md5sums=('e637a2702ceeadcf7865832311a5076a')

package() {
  msg "Start install.."
  install -Dm 755 "$srcdir/simona-scripts.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/pendrive-detect.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/image-mount.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/image-umount.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/boot-kernel-list.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/ioscheduler-list.sh" "$pkgdir/usr/bin"
  msg "Install ended."
}

