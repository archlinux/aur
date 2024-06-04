pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.60.1
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.60.1/erigon_2.60.1_linux_amd64.tar.gz")
b2sums=('521d521c122b61535515a6e50941be7091e6e9eefd59e5ff2f8c7a8ff80f197b48a3f9d40a290fa712c419c0edf95fc655d417d05828cde44f74922c77e6a323')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
