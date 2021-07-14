# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.50.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli' 'jfrog-cli-go')
provides=('jfrog-cli')

source_x86_64=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-amd64/jfrog")
source_i686=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-386/jfrog")
source_armv7h=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-arm/jfrog")
source_aarch64=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-arm64/jfrog")

noextract=("$pkgname-$pkgver-$pkgrel.jfrog")

sha512sums_x86_64=('23fd1b711141fbf04ed8529c2b949b05add2274dbefab9367af44c7f7655ffcef33440de87cb8be3b5613f55180209ea8c08c234b10baa2a0a5424190c9e205e')
sha512sums_i868=('6f3c383bd255bff66a64d5fcefa0fc1dfaa8c3cf689892be65bd4cb5e2663c94a07c116657ccf61a912c9653543cc5bbef31acb8098a949e2da50f5041fc3c99')
sha512sums_armv7h=('6fcaf33609c90f86ac26320531a39dd93aa281c2633059e74e081b283c1a1508c057db2bc1411d59b807166978d62d4c6d96a01d5e5d3b5370cf238e95bdf06c')
sha512sums_aarch64=('be2fabeb8d6902c106bce2c646da61cc44596d2a60903931c9ed476124c6f36a994c78cdf301304a559564cc785a9202afd5fd203afa8af7d8042b9f4e7d5ba7')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
