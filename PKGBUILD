# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=sentry-cli-bin
pkgdesc="A command-line utility to work with sentry.io"
pkgver=1.64.2
pkgrel=1
arch=('x86_64')
url='https://github.com/getsentry/sentry-cli'
source=(
  "https://github.com/getsentry/sentry-cli/releases/download/$pkgver/sentry-cli-Linux-x86_64"
)
sha256sums=('77b26ef4477b852c7cedd5d82b068875a2a8ad221fdd6cc465a1e250ec640c38')

package () {
  install -Dm755 "$srcdir/sentry-cli-Linux-x86_64" "$pkgdir/usr/bin/sentry-cli"
}
