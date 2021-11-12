#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-gpg_batch_sign
pkgver=2021.11.12
pkgrel=1
pkgdesc='A module and stand-alone script for batch-signing files with GPG.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-gpg_batch_sign"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2021.11.12.tar.xz
  https://xyne.archlinux.ca/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2021.11.12.tar.xz.sig
)
sha512sums=(
  2c5c56c28c0be18e29916c5ac4045ae3d0e08f5f4e6a2b0d335d04db3f174cac48897a4934aabad72caafac60c90a566740610ddfeff91e9d00f9473517b22f0
  9b14c86f4d3a9f36f581b88cff1f32007e2272adaf746042ccca93de98b58970adf5781099c2f8083ada1506afebc1b35e5e57cf9a0f18f5e1f89ca1e7e35af4
)
md5sums=(
  a9dc1666048ad1dfc94dcba9ddb6cdf1
  3f7724c2a08248f8021042851bcac5dd
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 gpg-batch_sign "$pkgdir"/usr/bin/gpg-batch_sign
}


# vim: set ts=2 sw=2 et:
