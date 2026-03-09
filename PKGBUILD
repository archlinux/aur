pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.3.9
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.3.9/erigon_v3.3.9_linux_amd64.tar.gz")
b2sums=('0d5f38679210da176f0d99011affad3f39d8813bd66d5caaa20f758c79e12c81bb2818ae368757c9545258e0db50773d06afb572b325c81461523a84010b62f6')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
