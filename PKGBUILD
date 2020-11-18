# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-bin
_pkgname=dotter
pkgver=0.9.1
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('6dd1b28698695fe1688c1adf1b2453d66d35e4d8f2c8d7d91d6cbf824c528c1ac7d2c27301fceff6605f4fbe4ebb74728d49d3ed1ddfdca48eeff5ce8a552fa6'
                   'f2962e611ed9de14d3caf4b93982ec87bb858a55cf4b1dd2f9c9ba6300c4e6deb19ee7f0f4a30040ed10c06ef2cdb024b0e8541aeef15bd625ddebed5a786829')

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/$_pkgname"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
