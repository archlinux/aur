# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.2.13
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('894a3460c017c88d43a9181c11022dc3281dba896400458f507bf1becdcd8408')
sha256sums_aarch64=('f1974af3fc495a679c5427e181735bbda27f43def63abaecc85dae624e9a56cc')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
