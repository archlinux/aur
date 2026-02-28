# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.2.10
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('416268ff2acd9498caf020e19fd0794888ae3acdbb2a50a4291eda9c28899bbc')
sha256sums_aarch64=('2441135f7d1b6ed857a95a288e991fb439160e77e477501adeb3763c9d4d334e')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
