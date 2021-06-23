# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.50.0
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

sha512sums_x86_64=('37ef405f1668f621373e0bf87ec0d0b76ae56016770372ac0e1ce43975f84a36fe147137fd5685fff54c1b1e4e05e32e3622b985d5d03d07a37e3d432984475d')
sha512sums_i868=('eec36aa89f375f91c94ccf92d165be99f74f2edf712eeaf0be1d712cc7fc58f688fe8911e773b6e9e746977de442bf990986a0036973efe45708d884e0224d29')
sha512sums_armv7h=('fe89042e9237193a8d3a509fa18e785760145bf48ceedff2925ed4ec579422f3a19a172f0634ba73eca2a9cd3a70fafa16a480344605cc5806c641db8453f1af')
sha512sums_aarch64=('644194f83748e0b01b7a63bdec54db78ce0e2aea63881aafe8b69df3732fa055c725ad1ff0a6f8a7405ba768bd8e39a16c0cf9911ef48ba4a57eccb26608b8c3')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
