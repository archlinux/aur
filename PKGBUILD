# Maintainer: Emanuel Bennici <emanuel at l0nax dot org>

pkgname=sentry-wizard
pkgver=4.6.0
pkgrel=1
pkgdesc="Sentry Project Setup Wizard"
url="https://github.com/getsentry/sentry-wizard"
arch=('x86_64')
license=('MIT')

source=("https://github.com/getsentry/sentry-wizard/releases/download/v${pkgver}/sentry-wizard-linux-x64")
sha256sums=('2eca4e2471fb8534063f0e226047b374335da2495d5e6fbb6887071ba9ae8837')

package() {
  install -Dm755 "${srcdir}/sentry-wizard-linux-x64" "${pkgdir}/usr/bin/sentry-wizard"
}
