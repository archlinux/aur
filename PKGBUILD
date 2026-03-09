# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.2.15
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('bb77125d6eec6c69217a0c49dcca41dced3f4bf6060608ab223ed5be1c9814e0')
sha256sums_aarch64=('023bf0cf0a4fb4b3fb580c9ab10c34e596176b4a1528a30d404be4e032acf811')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
