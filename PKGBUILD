# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.6
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('874fd573ff1b391912f99505de8f9171ec9d419a6e2aac700103752c4fd1f78e')
sha256sums_aarch64=('47b02f17f67717b4c733e94ac9088f601b946f893413d23a4aab7ad0a0ea6a29')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
