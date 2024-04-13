# Maintainer: ripping1903 <ripping1903 at proton dot me>
# Contributor: mikezackles <mikezackles at gmail dot com>
pkgname=sentry-cli-bin
pkgdesc="A command-line utility to work with sentry.io"
pkgver=2.31.0
pkgrel=1
arch=('x86_64')
url='https://github.com/getsentry/sentry-cli'
source=(
  "$pkgname-$pkgver::https://github.com/getsentry/sentry-cli/releases/download/$pkgver/sentry-cli-Linux-x86_64"
)
sha256sums=('baeb5b4ca0a5e500d667087f0b7fbb2865d3b8f01896cfba5144433dbe59bebd')

package () {
  install -Dm755 "${srcdir}/$pkgname-$pkgver" "$pkgdir/usr/bin/sentry-cli"
}
