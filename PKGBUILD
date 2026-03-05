# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.2.12
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('def15e76d95017b2662777df49b135a727bdfaed981f759ae2b2ae9b62c0d4df')
sha256sums_aarch64=('a2182e64cdc541640f9eed5d40c24defee3be02663c42f3a88351aad6f09d781')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
