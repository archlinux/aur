# Mantainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=sharpfin-patchserver
pkgver=0.7rc2
pkgrel=1
pkgdesc="Program you will need to use to perform the initial reciva radio patch"
arch=('any')
url="http://http://www.sharpfin.org"
license=('GPL')
options=('!strip')
source=("http://www.pschmidt.it/sharpfin/images/8/85/Patchserver_0.7rc2.tar.bz2")
sha512sums=('ba3302635d62da0b0fd008f1e8bef0ce47cf9bb2e7ff00e3947a56e1fcaf813115b5236bc943185f0187babc574497db12355647c64e72d1d8cab41dd677ee54')

package() {
  cd "${srcdir}/radiopatch"
  install -Dm755 patchserver-commandline "${pkgdir}/usr/bin/sharpfin-patchserver"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 sharpfin-test.patch "$pkgdir/usr/share/doc/$pkgname/sharpfin-test.patch"
  install -Dm644 sharpfin-test.patch.txt "$pkgdir/usr/share/doc/$pkgname/sharpfin-test.patch.txt"
  install -Dm644 patchfiles.lst "$pkgdir/usr/share/doc/$pkgname/patchfiles.lst"
  install -Dm644 PatchingTheRecivaRadio.pdf "$pkgdir/usr/share/doc/$pkgname/PatchingTheRecivaRadio.pdf"
}
