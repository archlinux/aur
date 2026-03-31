# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.16
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('51bbf7b738c6b53ae39c370bc385dc8d3ffb48e958cfecab08758a8c6217a166')
sha256sums_aarch64=('f14db4b5fa843043cc916f5589fe52105cc5a44604e8c246c43bf3effdb08a4d')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
