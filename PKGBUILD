# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.7
pkgrel=1
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
provides=('bluetuith')
conflicts=('bluetuith')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("499cff041be92b748d29c3890d3ee7ac903990e53350705f51f6c7ef527743d7")
sha256sums_i686=("0aaf4b4a104e18631bb3c293eb4275dc2b004d697c875515d685f38a898305ec")
sha256sums_arm=("52c2a17e9e8420571eb3f3142a2f51f9e5bd7f85cb94e2ba5506d1e26e68e97c")
sha256sums_aarch64=("a81d5781a65a30ce6824a7cf53dedb6f04347f096b8637323da33d5d24c734f2")
sha256sums_armv6h=("0f7cba2c6492b70705be5a537b06b38e9572da376b2a7775440dbab6e8c3f180")
sha256sums_armv7h=("69e289ac70f26450f4e426b03c0995c17a2193268c085c15fbd90b90c8f7e208")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
