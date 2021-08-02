#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-gpg_batch_sign
pkgver=2021
pkgrel=1
pkgdesc='A module and stand-alone script for batch-signing files with GPG.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-gpg_batch_sign"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2021.tar.xz
  https://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2021.tar.xz.sig
)
sha512sums=(
  7ee363d65a698615451c933ef6ff0e81f34a6ee109eb1210aef6b32a35f1178aa37d7f0808e577d5f34c32637b098de1cd11e60f57046d5ad9f9ca764019808b
  5ee8620eeb7470d7c8869de12a2e0e74c67f89f8ef8cd34777842ef94670976cd38309b1242c99bcaca2bb02053b21ffd48a2d981433ab70b099cbc9b4d1d0ce
)
md5sums=(
  3a51a161d34d6fa438662866f401992b
  0d8d8579d3c0382a9dfe1e3bac2381e0
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 gpg-batch_sign "$pkgdir"/usr/bin/gpg-batch_sign
}


# vim: set ts=2 sw=2 et:
