# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=truecrypt-mount
pkgver=2
pkgrel=1
pkgdesc="Truecrypt mount helper for fstab"
arch=(any)
url="https://wiki.archlinux.org/index.php/TrueCrypt#Mount_volumes_via_fstab"
license=('Public Domain')
provides=('mount.truecrypt')
source=("$pkgname.sh")
sha1sums=('e15c33eea1efeaa1d19a54f6aa2dbe634da11857')
depends=('truecrypt')

package(){
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 "$pkgname.sh" "$pkgdir/usr/bin/$provides"
}
