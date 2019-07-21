# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=sentry-cli-bin
pkgdesc="A command-line utility to work with sentry.io"
pkgver=1.46.0
pkgrel=1
arch=('x86_64')
url='https://github.com/getsentry/sentry-cli'
source=(
  "https://github.com/getsentry/sentry-cli/releases/download/$pkgver/sentry-cli-Linux-x86_64"
)
sha256sums=('98135649385efe4b9f29d8a0719a7b451da2e6f9f988b0de976a8a66dc0ee411')

package () {
  install -Dm755 "$srcdir/sentry-cli-Linux-x86_64" "$pkgdir/usr/bin/sentry-cli"
}
