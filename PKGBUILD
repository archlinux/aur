# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.24
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('41d938cd6a1b9ac627e474e9dc9e1de8c28f92a204ced6110191b418f989336b')
sha256sums_aarch64=('393038aa2200ef182542598ae4e22df2a0262586008ffc566e2d46ff781f6745')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
