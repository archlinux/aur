# Maintainer: Abhinav Gupta <mail@abhinavg.net>

pkgname='restack-bin'
pkgver=0.7.0
pkgrel=1
pkgdesc='Makes interactive Git rebase aware of intermediate branches.'
url='https://github.com/abhinav/restack'
arch=('aarch64' 'armv7h' 'x86_64')
license=('GPL-2.0')
provides=('restack')
conflicts=('restack')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/abhinav/restack/releases/download/v0.7.0/restack-linux-arm64.tar.gz")
sha256sums_aarch64=('97f13f1eb494125dbc05451ef22f3811a6da655b4a61dde768848a3536806ea8')

source_armv7h=("${pkgname}_${pkgver}_armv7h.tar.gz::https://github.com/abhinav/restack/releases/download/v0.7.0/restack-linux-armv7.tar.gz")
sha256sums_armv7h=('926b28b9ef602a665ee29d643b0fa136ed7c3f8cc3c465b9f9cf637573aa8341')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/abhinav/restack/releases/download/v0.7.0/restack-linux-amd64.tar.gz")
sha256sums_x86_64=('7e1adc21889c6ad550db37f235438a38aa1fd8fc32b874c808fdda699e34e4ac')

package() {
  install -Dm755 "./restack" "${pkgdir}/usr/bin/restack"
}
