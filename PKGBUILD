# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.47.2
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

sha512sums_x86_64=('01bdb8adefbb56ef80550c7606211c780e5cf9b1c9af05ba5ea2b52a9519bf3f86766300a2fa6ae1898bd685455fb23dec46e52d26715f195aad717afddaa12a')
sha512sums_i868=('cb9ea6f25c976488a2ea3fc32c3f0c22ab070e2c097da6267439cd9031a37559847308fab8a10395945203c1e3aa73f900f95049a7d6bdac4d69874a49c025d3')
sha512sums_armv7h=('ffced87c28d3f5337d594a929a9b78edc73ce362744cf3a91fddc1788332018317a6e5344a5cef96659fdfed63ec83f5337d36010420a339f41a672d6179a0a1')
sha512sums_aarch64=('9562878f1b2e6aa1737e55a0b11bff96cc54fc02e8832f342171ca00a8ddb66429006c13c331efe330b18d0d7c6f89d6f3dbeef9be919def15c8e2b4a88ee8a7')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
