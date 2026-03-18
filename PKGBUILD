# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.14
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('b71c58be2e2bf10848f2605ebe1bc0dc8290fd4a621a4f289c9264385f0cbdee')
sha256sums_aarch64=('09e95c3211ae968a0daaf6ff499a4972c87dffa450651ab1f6ae66b0eefe0b62')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
