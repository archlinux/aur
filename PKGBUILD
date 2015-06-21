#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-gpg_batch_sign
pkgver=2015
pkgrel=1
pkgdesc='A module and stand-alone script for batch-signing files with GPG.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-gpg_batch_sign"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2015.tar.xz
  http://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2015.tar.xz.sig
)
sha512sums=(
  628254107ef2b26ff52ed5d3f07ff7e9149fb1385f326d3190de509e2c2f80e58620c174be4d3d431ad55e092f1ec5a540dbf80de35e8fe2c52d389586bde3bd
  43cf6987f06e0f5e66095cf2a4fffb52ef4da179e850a7703e9bf0764c85ee4bec72989183c264389760ab2862db80a420027d0fc9fce542ac612398a669c5e6
)
md5sums=(
  5cd9b180671b516a622bf35d03d8b3e8
  f8174f6c1dde9fe3b9ca40013b86af2b
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 gpg-batch_sign "$pkgdir"/usr/bin/gpg-batch_sign
}


# vim: set ts=2 sw=2 et:
