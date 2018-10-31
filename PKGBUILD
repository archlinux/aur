# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=grub-custom-simona
pkgver=0.0.1
pkgrel=1
pkgdesc="expand grub2 'grub-mkconfig' command."
#url="http://www.foo.tld"
arch=('any')
license=('GPL2')
depends=('grub' 'bash')
source=($pkgname-$pkgver.tar.gz)
backup=('etc/default/grub-custom')
#generate with 'makepkg -g'
md5sums=('87fda850bd490f66965488d6ee523a3a')
                  
package() {
  install -Dm 644 "$srcdir/etc/default/grub-custom" "$pkgdir/etc/default/grub-custom"  
  install -Dm 755 "$srcdir/etc/grub.d/11_linux_simona" "$pkgdir/etc/grub.d/11_linux_simona"  
  #install -Dm755 -t "${pkgdir}/etc" etc/*
}

