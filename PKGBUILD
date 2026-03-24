# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.7
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('8ade756437ceff131b6b93d563b80200f63f441cc39e23a458597e3db09b9e49')
sha256sums_aarch64=('736ca06439bf999aa493ec302ffb38759ea20bb98f5d7a0aafb16987a1b772b1')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
