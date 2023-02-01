# Maintainer: Sergio Losito <shape93@gmail.com>
pkgname=psa-update
pkgbase=psa-update
pkgdesc='CLI alternative to PSA (Peugeot / Citroën / DS / Opel) infotainment system update (NAC / RCC firmware and navigation maps), hopefully more robust.'
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url='https://github.com/zeld/psa-update'
license=('UNLICENSE')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
noextract=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
md5sums=("6a5dd28308dd7e4dd84fee73d289f969")

package() {
     cd "${pkgname}-${pkgver}-x86_64-unknown-linux-gnu"
     install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
     install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

