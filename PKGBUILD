# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Imported from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=nfspy
pkgver=1.0
pkgrel=1
pkgdesc="A Python library for automating the falsification of NFS credentials when mounting an NFS share"
url="https://github.com/bonsaiviking/NfSpy"
license=('MIT')
arch=('any')
depends=('python2' 'python2-fuse')
source=("https://github.com/bonsaiviking/NfSpy/archive/v$pkgver.tar.gz")
sha512sums=('dce93054e242acdfa6db78d92cdc4538b1187a981573d5aa530717db73b777acbda3570531d80d8401fc78eee848f5eebb74eafff82e4b176505c40d8d841b29')

package() {
  cd "$srcdir/NfSpy-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
