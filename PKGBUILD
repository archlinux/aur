# Maintainer: LysandraXen
pkgname=manatan-bin
pkgver=3.4.8
pkgrel=1
pkgdesc="Manatan Server. A robust manga server application."
arch=('x86_64' 'aarch64')
url="https://github.com/KolbyML/Manatan"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('manatan')
source_x86_64=("Manatan-v${pkgver}-Linux-amd64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-amd64.deb")
source_aarch64=("Manatan-v${pkgver}-Linux-arm64.deb"::"$url/releases/download/v$pkgver/Manatan-v${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=('a8370330c5bfe69e415611f9e94abb1fd6e44bf27a20758e0181b3f2b5108b91')
sha256sums_aarch64=('5cd903fec734b8161ec7aead5b73fdd15fd6c351d8179f98b1bed00704f2cbfb')


package(){

	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

}
