# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.2.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli' 'jfrog-cli-go')
provides=('jfrog-cli')

source_x86_64=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v2/$pkgver/$_pkgname-linux-amd64/jfrog")
source_i686=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v2/$pkgver/$_pkgname-linux-386/jfrog")
source_armv7h=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v2/$pkgver/$_pkgname-linux-arm/jfrog")
source_aarch64=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v2/$pkgver/$_pkgname-linux-arm64/jfrog")

noextract=("$pkgname-$pkgver-$pkgrel.jfrog")

sha512sums_x86_64=('5ebda0c2a8234779abecdb52fe047d8e69845f21eccf8c4b3619b4113f634dd7194407c6b398f59f24df47acfe2d09a43f6c2180504be83cfa25c2d4763be359')
sha512sums_i868=('38a8b2fba387cb372b2ed16917f6c6d21854f5cc016d39f254f6b4b6133ec83b0a6e37f525e6438950336fdec2b9f09520f4d4032b5df0d15a016da6df207b4e')
sha512sums_armv7h=('b0ff1f3edbc7fa427a61a2dc2e2a2b72af25c2b83acad48f9916d5642edf8b36f0fad6c2d042da9cb805f4af2a300b8dff25a538130029fd6ae8c47d0214b21f')
sha512sums_aarch64=('bf85a0ea055aedfd1ef322fd411edefd0ea68a31c8399071d2e70c0408ccbd1f6ed364427233a9f10a79f62bf2a60fd0b80728c711678ec4645ee307f9dde6ca')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
