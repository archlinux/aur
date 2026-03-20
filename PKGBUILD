# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.1
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('4ce675ebe899733fec78b1fac9b037a19b504a1d6b2e05e1474983326bb2bf43')
sha256sums_aarch64=('09f83739061091df206fbb4f0bae7969b47d7e56f608a439eee744db48ae1e73')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
