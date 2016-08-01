#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-gpg_batch_sign
pkgver=2016
pkgrel=1
pkgdesc='A module and stand-alone script for batch-signing files with GPG.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-gpg_batch_sign"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2016.tar.xz
  http://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2016.tar.xz.sig
)
sha512sums=(
  0844d663f148b8e0dac531bffca7fe477c795ff0fd255ad8db78e4d81ae7dadcdfed7e05f8ef9f316c1c31f4712742cd957c1447e733e8ccb4ce366ab89ab498
  294427a7990a7a4b824296bbd91c0faf0ac7f4bb3669640d6d4aab23def95db4f09787bbd334a22c7ca730b014fef6e9f61b8a6f0871d2baf473f764ec2a8ccb
)
md5sums=(
  1210c34dd062a31b7a5045e338c88de3
  d7081963592242d1e45fe41df1cbd6dc
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 gpg-batch_sign "$pkgdir"/usr/bin/gpg-batch_sign
}


# vim: set ts=2 sw=2 et:
