# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.26
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('075bd57eebed967574529489d727fb485bfe9f7c27f9039e9776c8ae16fef1a8')
sha256sums_aarch64=('763054921e8c4b8d8c26fc32c835200b9b340dcb6bf2025ca2037b99332ecbdc')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
