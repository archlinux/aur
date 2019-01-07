# Maintainer: David Bittner <bittneradave@gmail.com>
pkgname='setup'
pkgver=0.1
pkgrel=1
pkgdesc="A utility for manage dotfiles and install scripts."
arch=('x86_64')
url="https://www.gitlab.com/DavidBittner/setup"
license=('MIT')
depends=()
makedepends=('unzip')
sha512sums=('49fb9b865544c3f117b66e20622f14eea913451affcbb9cd5827a20b0fcca3f83411785858ab02f6ff74aee422dc6fc9021cba2850245df1cf5f8d7ce4bba91f')
provides=('setup')
conflicts=('setup')
source=('https://gitlab.com/davidbittner/setup/-/jobs/142141969/artifacts/download.zip')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m 777 setup -T "${pkgdir}/usr/bin/setup"
}
