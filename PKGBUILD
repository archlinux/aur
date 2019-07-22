# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=sentry-cli-bin
pkgdesc="A command-line utility to work with sentry.io"
pkgver=1.47.0
pkgrel=1
arch=('x86_64')
url='https://github.com/getsentry/sentry-cli'
source=(
  "https://github.com/getsentry/sentry-cli/releases/download/$pkgver/sentry-cli-Linux-x86_64"
)
sha256sums=('219cb77fbb41a63a13a56704a7e0511d5bd1fa2ddd6e31209764a034c525f929')

package () {
  install -Dm755 "$srcdir/sentry-cli-Linux-x86_64" "$pkgdir/usr/bin/sentry-cli"
}
