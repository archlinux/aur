# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.2.14
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('55a9d7391927a688e8baee4719fadf6036dcd51bcae29a7b41c8fcb61d23bcd5')
sha256sums_aarch64=('f8389f7a09fc6e566ff5d4c36c63ff1675f2a16d223cbec0aa14ffc014bcc52f')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
