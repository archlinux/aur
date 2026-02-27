# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=git-koji-bin
_pkgname=koji
pkgver=3.4.0
pkgrel=1

url='https://github.com/cococonscious/koji'
pkgdesc='An interactive CLI for creating conventional commits.'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('koji')

source_x86_64=("$pkgname-x86_64-$pkgver.tar.gz::https://github.com/cococonscious/koji/releases/download/v$pkgver/koji-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.tar.gz::https://github.com/cococonscious/koji/releases/download/v$pkgver/koji-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5a68fd6def6d3b7eb8de4afa3e1d1ae9ea7337ed2527762169f1239893fa5c54')
sha256sums_aarch64=('85e5178eae873946979d188a11ba3dc11f65362af0f5dcb7ada376c746c5efa4')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
