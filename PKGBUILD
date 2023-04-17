# Maintainer: cembro <cembro at pm dot me>
pkgname=tkey-verification-bin
_pkgname=tkey-verification
pkgver=0.0.2
pkgrel=2
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
sha512sums=('c893610b432fc59b27620f5f3857e4e76bf0cdd20f9ece3e456f3403c745ff81cea5cb8b7558728c35d9dd65f3a1a5f508b1cb2dd8a5def9aabf1739ebdde99b'
            '25459b2c42636d230f3a5abd30fbeff61940ebdb6b2793544dea9b0c49a069142f5aa0f86acd693b227cb0008b33c1ada6f07e30e4b7c2f9e36fe4d45e7f53d1')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}

