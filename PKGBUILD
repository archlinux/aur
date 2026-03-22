# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.5
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('57243848655205362c04d67ea5480192c6285016720f75d1ddbf24efbabe3084')
sha256sums_aarch64=('f8c054306c3a5b47fc5e8bd61ea3251fc454220ea768549e08d2fda4286c8994')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
