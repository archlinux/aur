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
sha256sums_x86_64=('7d8182afea46b7e5e700e3b92b7ff74c4a90d72a53a7b164a1a4b7316a80fe55')
sha256sums_aarch64=('a7726fbc46edfcfd6b68baa193d338b3140c30dabca98efd343c37c58f83d69b')
sha256sums_armv7h=('49294ac8d8bdcf5aaae6864158479d6d7d99e42ad415c84dd720bf91078f1d5b')


package() {
    install -Dm755 "$srcdir/wireproxy" "$pkgdir/usr/bin/wireproxy"
}

