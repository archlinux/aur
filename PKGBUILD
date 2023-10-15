# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=kurtosis-cli-bin
pkgver=0.84.6
pkgrel=1
pkgdesc="Kurtosis is a platform for packaging and launching environments of containerized services with a focus on approachability for the average developer."
arch=('x86_64')
depends=('docker')
url="https://github.com/kurtosis-tech/kurtosis"
license=('Business Source License 1.1')
source=("$pkgname-${pkgver//_/-}.tar.gz::${url}-cli-release-artifacts/releases/download/$pkgver/kurtosis-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c583a907acb33f02670ce02eb3f7455be20cd1d364874ba6c5f635458b5a2f7d')

package() {
    install -Dm755 kurtosis "$pkgdir/usr/bin/kurtosis"
}

