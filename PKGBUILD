# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=grub-custom-simona
pkgver=0.0.2
pkgrel=2
pkgdesc="Compile an alternative list of the usable kernels of the grub boot menu indicating the kernel relase, obtained from the output of the 'file' command, instead of the file name."
url="https://github.com/simona70/grub-custom-simona"
arch=('any')
license=('GPL2')
depends=('grub' 'bash')
source=($pkgname-$pkgver.tar.gz)
backup=('etc/default/grub-custom')
#generate with 'makepkg -g'
md5sums=('c7356d33163852bca20da96cb446cadf')

package() {
  #install -m755 -d "${pkgdir}/etc/default"
  #install -m755 -d "${pkgdir}/etc/grub.d"
  install -Dm 644 "$srcdir/etc/default/grub-custom" "$pkgdir/etc/default/grub-custom"
  install -Dm 755 "$srcdir/etc/grub.d/11_linux_simona" "$pkgdir/etc/grub.d/11_linux_simona"
}

