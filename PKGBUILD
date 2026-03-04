# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.2.11
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('612194fca4b0fbf22e686c148fb22bf8cefad7d436798418c5b4e822334ba909')
sha256sums_aarch64=('2f32cc3b426cc0acfa17a75ed183c4d081a471fa70c1acd355daa7de8d731fb8')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
