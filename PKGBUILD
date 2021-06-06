# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.48.1
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

sha512sums_x86_64=('88aa7b2f8864967ecf7dd723a6e253bb31f3424fe1d41bc817506d88ebe3ad74a8c184030d371a9508bab33fa0f0281dd06abf80c30c9bdbf1c57434a2f23359')
sha512sums_i868=('73badcc65560939e199d18a7e306303933a2a75a5aef5afe33f6ed119cd8010b3092c2a19835beda18a47a7ff4001ecedfae1666a108f8741860ba9bb745beb0')
sha512sums_armv7h=('93a39df122e5ba3f4898c0effdcf8ec04bf79e8edd72c1315379885ec31d8b168c5f9e4314720658ef17889560236deaebdc613e520ef4eb75dadb09ab12ff69')
sha512sums_aarch64=('41047731c62cb8c43ea02288113b9b4260543604c8b18d28ff3fe4bda6c94dca4620d59a68bb24baecbea95d8f477fa462b014b0209aae3c11dc1011229dca88')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
