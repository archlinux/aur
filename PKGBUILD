# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=5.0.6
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('98c33574d9ec98da6f04d9dcd9a3a7097bd5e0e20b3b84329c5cff04126d59fe')
sha256sums_aarch64=('4fd16efaa513b9f47a661813012f216bca35dc20d9148d2aabdd6ebed1b2b0fb')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
