# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=sentry-cli-bin
pkgdesc="A command-line utility to work with sentry.io"
pkgver=1.68.0
pkgrel=1
arch=('x86_64')
url='https://github.com/getsentry/sentry-cli'
source=(
  "$pkgname-$pkgver::https://github.com/getsentry/sentry-cli/releases/download/$pkgver/sentry-cli-Linux-x86_64"
)
sha256sums=('218191471856b11382d38ea6a7e9663d42ce3b50f9b1d5b8a7156b598b8c9e7c')

package () {
  install -Dm755 "${srcdir}/$pkgname-$pkgver" "$pkgdir/usr/bin/sentry-cli"
}
