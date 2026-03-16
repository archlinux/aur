# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.3.9
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('287083116714be454fd7ca30bbda90103318d1837987fe205ca637a232de4af9')
sha256sums_aarch64=('88e9280a5fbcad9305fd23e419016cbe1be25de719507708431fea13fa0504dd')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
