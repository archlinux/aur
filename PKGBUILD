# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.28
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('d288b935f888a5f721d3de71a197eef24bba472f45ca9ac065d004d782b5212b')
sha256sums_aarch64=('42be9c737b238ad4c285b9343c4fa8d2e404b653e4849972aa120f9d5c35893b')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
