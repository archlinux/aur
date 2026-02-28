# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.2.9
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('149c431fbb2cc7303f909cbf457d4c5e26c0b255ff707580dd760746599503c4')
sha256sums_aarch64=('0d772532c2a364d727e729589814f135cc47e156eae4d8deea64671ae37a5600')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
