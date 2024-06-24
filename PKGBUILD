# Maintainer: killab33z <killab33z @ protonmail-dot-com>
# Old Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=cork-rs-bin
pkgver=0.2.6
pkgrel=2
pkgdesc="Command-line calculator for hex-lovers"
arch=('x86_64')
url="https://github.com/reddocmd/cork"
license=('GPL')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "cork-rs-git")
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/cork"
        "README-$pkgver.md::$url/raw/v$pkgver/README.md"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/RedDocMD/cork/main/LICENSE")
sha512sums=('0b2717a3ae52b5f8684e8a6e11d857bfb19d96ee25ac56f3d6253968e04ebed59da0d50a9accd6eea2d85ccffe86008f3d6d5dea4abdbdba5e253f6b9f516718'
            'a4c72aa374b1a4e20e8e08a17dad4c3bd97f925a91c3b34b4fe6c1189c62a5b10798f120c0cf354b19d84cf2147cf5963655e7bd7ba3392fe8ce84d56a707841'
            'f27ec2d059bc925cc6e6000d500aaa29b38a5a012fd146276fd456f9a42d6e3e63bb3c68a0953d4d7af37b6aac5339d50ac117986dd0a1a070d544d31b862d19')

package() {
  install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/cork"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
