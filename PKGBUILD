# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=sentry-cli-bin
pkgdesc="A command-line utility to work with sentry.io"
pkgver=1.64.1
pkgrel=1
arch=('x86_64')
url='https://github.com/getsentry/sentry-cli'
source=(
  "https://github.com/getsentry/sentry-cli/releases/download/$pkgver/sentry-cli-Linux-x86_64"
)
sha256sums=('9b0f40b559dfedc143a5c55aeb0e4c60d16bb4b105d6e953832509048ea40b08')

package () {
  install -Dm755 "$srcdir/sentry-cli-Linux-x86_64" "$pkgdir/usr/bin/sentry-cli"
}
