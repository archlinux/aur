# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.8
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('62e4e198e985deeff68ba1387710bfb8004b46e48fa4f2ea60442901ad5a9e4c')
sha256sums_aarch64=('31e33f3484e8af898bd7d42064afbb7bb2790d755630cceae857cf596caf9c99')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
