# Maintainer: sum01 <sum01@protonmail.com>
pkgname=vcash-bin
pkgver=0.6.0.4
pkgrel=5
pkgdesc="A decentralized currency for the internet."
arch=('i686' 'x86_64')
url="https://github.com/openvcash/vcash"
license=('AGPL3')
depends=('gcc-libs')
optdepends=("vcash-rpc: rpc command script")
source_x86_64=("https://github.com/openvcash/vcash/releases/download/$pkgver/vcashd-$pkgver-linux64.tar.gz"
	"https://github.com/openvcash/vcash/releases/download/$pkgver/vcashd-$pkgver-linux64.tar.gz.sig")
source_i686=("https://github.com/openvcash/vcash/releases/download/$pkgver/vcashd-$pkgver-linux32.tar.gz"
	"https://github.com/openvcash/vcash/releases/download/$pkgver/vcashd-$pkgver-linux32.tar.gz.sig")
sha512sums_i686=('06210c5893675b422b9467cc2581d409e2e5e13b290f9351ecdadb086ca7478a4a624e3c31f140919778b0b157814619c4210c56ed02a6f45f3327e8853acfba'
                 'SKIP')
sha512sums_x86_64=('42c59ad6e19dc923105d8148c0738c36fa6afbc5797dca41a6110c50a9869d65edc939d58390f36a76d62c016630071ded8d841e5299df52c8844c32924fbcf1'
                   'SKIP')
conflicts=('vcash')
provides=("vcash=$pkgver")
validpgpkeys=('3AD44B909DC5AA919BF97768339CB8BE119B90C0')
package() {
	install -Dsm755 "$srcdir/vcashd" "$pkgdir/usr/bin/vcashd"
}
