# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('25078c0232458080822d90c8544d5d400bbd65f577f0467ab57a6216c74131ae')
sha256sums_aarch64=('4cd835a696b6bac1e7b5baff58e4f0f70e0759ab168859af2af0d08edbb5161f')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
