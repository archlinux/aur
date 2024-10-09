# Maintainer: Sergio Losito <shape93@gmail.com>
pkgname=psa-update-bin
pkgbase=psa-update
pkgdesc='CLI alternative to PSA (Peugeot / Citroën / DS / Opel) infotainment system update (NAC / RCC firmware and navigation maps), hopefully more robust.'
pkgver=1.0.6
pkgrel=1
arch=('x86_64')
url='https://github.com/zeld/psa-update'
license=('UNLICENSE')
depends=('openssl')
source=("${pkgbase}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"::"${url}/releases/download/${pkgver}/${pkgbase}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
noextract=("${pkgbase}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"::"${url}/releases/download/${pkgver}/${pkgbase}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("fc53df1d8da03f1670f3957df7c362397d6da7fa4f2e6df0c986bdebf9e748e4")

package() {
     cd "${pkgbase}-${pkgver}-x86_64-unknown-linux-gnu"
     install -Dm755 "${pkgbase}" "$pkgdir/usr/bin/${pkgbase}"
     install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

