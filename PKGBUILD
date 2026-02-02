# Maintainer: Sergio Losito <shape93@gmail.com>
pkgname=psa-update-bin
pkgbase=psa-update-bin
pkgdesc='CLI alternative to PSA (Peugeot / Citroën / DS / Opel) infotainment system update (NAC / RCC firmware and navigation maps), hopefully more robust.'
pkgver=1.0.10
pkgrel=1
arch=('x86_64')
url='https://github.com/zeld/psa-update'
license=('UNLICENSE')
depends=('openssl')
source=("psa-update-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"::"${url}/releases/download/${pkgver}/psa-update-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
noextract=("psa-update-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"::"${url}/releases/download/${pkgver}/psa-update-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('fc18a3bb8a35e17eb44573ef199fb71a152c81132ed2c9deecc7a37f01c65d24')

package() {
     cd "psa-update-${pkgver}-x86_64-unknown-linux-gnu"
     install -Dm755 "psa-update" "$pkgdir/usr/bin/psa-update"
     install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/psa-update/LICENSE"
}

