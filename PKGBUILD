# Maintainer: Sergio Losito <shape93@gmail.com>
pkgname=psa-update
pkgbase=psa-update
pkgdesc='CLI alternative to PSA (Peugeot / Citroën / DS / Opel) infotainment system update (NAC / RCC firmware and navigation maps), hopefully more robust.'
pkgver=1.0.1
pkgrel=3
arch=('x86_64')
url='https://github.com/zeld/psa-update'
license=('UNLICENSE')
depends=('openssl')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
noextract=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("af5daa95fbebb12152d65a9810581e5f93fa29b37d49aa230219ed5736e30571")

package() {
     cd "${pkgname}-${pkgver}-x86_64-unknown-linux-gnu"
     install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
     install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

