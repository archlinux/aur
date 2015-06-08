# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=truecrypt-mount
pkgver=1
pkgrel=3
pkgdesc="Truecrypt mount helper for fstab"
arch=(any)
url="https://wiki.archlinux.org/index.php/TrueCrypt#Mount_volumes_via_fstab"
license=('Public Domain')
provides=('mount.truecrypt')
source=("$pkgname.sh")
sha1sums=('42f1233d5794cbc92cbbc6465aabb079cf73b260')

package(){
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 "$pkgname.sh" "$pkgdir/usr/bin/$provides"
}
