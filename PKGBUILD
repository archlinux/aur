# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.18
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('f11344f556ca4609e98a2c54c04e253ec44cb17132a049229401f2ee04fad273')
sha256sums_aarch64=('5c18b4e7e89b539510ff7f329db342aacef8a905c79743964eaf8f8dd9bfd3f1')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
