# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.11
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('72235b0efbe388388c54ec4759e944af823609282b8189f6c2f72e853ca8292d')
sha256sums_aarch64=('75fc664a41d54d49301da788997a40963fa7a57a42092a1478cb03e61808fb3b')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
