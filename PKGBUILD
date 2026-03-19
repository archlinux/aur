# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.16
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('1e053f60812561b6cb3558c9c25936bf285071fe8880efc18cfa723f00936471')
sha256sums_aarch64=('dae53573f83a52f8d488301a66ea1cb5cc59123abb8659518c874f3d8b333bfb')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
