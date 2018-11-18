# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.1
pkgrel=1
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
md5sums=('0e55f720e27ebb2791248a93f48ed8b6')

package() {
  install -Dm 755 "$srcdir/simona-scripts.sh" "$pkgdir/bin"
  install -Dm 755 "$srcdir/pendrive-detect.sh" "$pkgdir/bin"
  install -Dm 755 "$srcdir/image-mount.sh" "$pkgdir/bin"
  install -Dm 755 "$srcdir/image-umount.sh" "$pkgdir/bin"
  install -Dm 755 "$srcdir/boot-kernel-list.sh" "$pkgdir/bin"
  install -Dm 755 "$srcdir/ioscheduler-list.sh" "$pkgdir/bin"
}

