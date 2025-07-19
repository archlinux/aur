# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=git-koji-bin
_pkgname=koji
pkgver=3.2.0
pkgrel=1

url='https://github.com/cococonscious/koji'
pkgdesc='An interactive CLI for creating conventional commits.'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('koji')

source_x86_64=("https://github.com/cococonscious/koji/releases/download/v$pkgver/koji-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/cococonscious/koji/releases/download/v$pkgver/koji-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ed48ada9ecebb4f0c8923909c3e3b53375a6e5f6e50763320af36292742ef335')
sha256sums_aarch64=('e557f75c311836cc37c19f573671d2ab646c8a030ced0243c4e00bda94a6a87b')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
