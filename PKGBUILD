# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

_dkim='dkim_verifier'
pkgname='thunderbird-dkimverifier'
pkgver='1.3.4'
pkgrel='0'
pkgdesc='This is an add-on for Mozilla Thunderbird that verifies DKIM signatures according to the RFC 6376'
arch=('any')
url=https://github.com/lieser/${_dkim}
license=('AGPL')
depends=('thunderbird')
source=("$url/releases/download/v$pkgver/${_dkim}-$pkgver.xpi")
sha256sums=("f6286eb9d8fb84251a8a4a031301dae8599c7653c8dd35ec0fedc1941e76623f")

package() {
  pushd "$srcdir"
  install -Dm644 "${_dkim}-${pkgver}.xpi" "$pkgdir/usr/lib/thunderbird/extentions/${_dkim}@pl.xpi"
  popd
}
