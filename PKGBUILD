# Maintainer: Theo Morra <theo@theom.nz>

pkgname=humble-trove
pkgver=1
pkgrel=1
license=('MIT')
pkgdesc="The cross platform Humble Trove Downloader"
arch=('x86_64')
url="https://github.com/td512/Humble-Trove-Console-Downloader"
source=("trove::https://ltscdn.m6.nz/humble/1804/trove")
sha256sums=('32cb5bdf271a39421f0453508dd80779dee047621caa97e56e435844256003dd')

package() {
 install -Dm755 ./trove "${pkgdir}"/usr/bin/trove
}
