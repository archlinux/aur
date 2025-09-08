# Maintainer: ftk

_pkgname='wireproxy-awg'
pkgname="${_pkgname}-bin"
pkgver=1.0.12
pkgrel=1
pkgdesc="AmneziaWG compatible wireguard client that exposes itself as a socks5 proxy"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/artem-russkikh/wireproxy-awg"
license=('ISC-1')
depends=('glibc')
provides=(${_pkgname} wireproxy)
conflicts=(${_pkgname} wireproxy)
source_x86_64=("${url}/releases/download/v${pkgver}/wireproxy_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/wireproxy_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/wireproxy_linux_arm.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')


package() {
    install -Dm755 "$srcdir/wireproxy" "$pkgdir/usr/bin/wireproxy"
}

