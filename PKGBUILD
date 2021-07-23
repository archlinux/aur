# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.1.1
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

sha512sums_x86_64=('fd74e96236a77a7887f7adf5fdb555cde440d9c539d92f5e042237f50e17ce9851e41d6298918377cae4e1c8262243d87f5545ea49b64c1a22ec93546e73614a')
sha512sums_i868=('ed2c2ce7426e27fa101bcd18da1c6fb47669f132ff43e280867e21d594a20f2547e835f850de7b2d98d51c1705b3b6b1944e186a89ce8ce2372daab349dc21a6')
sha512sums_armv7h=('341cacb37f24f7230ba54c35b103a47b93b5d674b6f7845d96fa6a7fe939db0403931bbef1503ea2f42725011104e598fd6aef6632e8130b830a9c5f794d5a3a')
sha512sums_aarch64=('bd7bc53e44c9271e2866e31eec32d9186848b5c8105b8a80cc825d125f183fbd860d6fac77fcfc99cda219ffa654e137dab31f69309335872ed65514bb9b2496')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
