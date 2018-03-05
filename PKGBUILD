# Maintainer: Alex Peltzer ("alexpe87") <alexpe.aur@mailbox.org>

pkgname=circleci-cli
pkgver=1.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc="A CircleCI client for building conda packages locally for example."
arch=('i686' 'x86_64')
url=""
license=('GPL3')
source=(https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci)
md5sums=('6b0d27cacf7294f3c04e4434f4dbbd8a')


package() {
  install -Dm755 circleci          $pkgdir/usr/bin/circleci
}
