# Maintainer: cembro <cembro at pm dot me>
pkgname=tkey-verification-bin
_pkgname=tkey-verification
pkgver=0.0.1
pkgrel=1
pkgdesc="Vendor signing and user verification of Tillitis TKey genuineness"
arch=('any')
depends=()
makedepends=()
url="https://tillitis.se/app/tkey-device-verification/#platform-linux"
license=('GPL-2.0-only')
provides=('tkey-verification')
source=(
  "$_pkgname::https://github.com/tillitis/tkey-verification/releases/download/v${pkgver}/tkey-verification_${pkgver}_linux-amd64"
  "$_pkgname.1::https://github.com/tillitis/tkey-verification/raw/v${pkgver}/system/tkey-verification.1"
)
sha512sums=(
  '62ab13e297a4670a53c1ecb98d8ce52a3dc66e59f9b42d5304ede206defbf655debad9c688dde86ba5abafb3d834390ee45a231486bbc06090e8b3e56a747fdc'
  '25459b2c42636d230f3a5abd30fbeff61940ebdb6b2793544dea9b0c49a069142f5aa0f86acd693b227cb0008b33c1ada6f07e30e4b7c2f9e36fe4d45e7f53d1'
)

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}

