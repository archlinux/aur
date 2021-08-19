# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.2.0
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

sha512sums_x86_64=('24e1d09ee3156172156b1b005b9517ece21aa8da3a6c7e3ce41a464978210224873297aa98b949757beebd06c5ffdb7a91ab77318d9aa63e440b30dbec0c9e1f')
sha512sums_i868=('822e9dfe9db2eef0d57b1867a12ba031c28922910280e4dcb35f46ecc31a533f1c99c6df19b9d5a82a638512314651b2400eeab0f819534627c7aedc8cd5f471')
sha512sums_armv7h=('db269055969126f3b374f013dd163b456a76c4b056b4797a16d6d57537527c913bf68ee37a34917ae688822f3e46600c7408b6d07bfac1ab64c48f9a6a6d5f0a')
sha512sums_aarch64=('4d230a5b1173fc19adc1e7b36913ba94626d4e00d7e3eb96c2e99bd068a913380b3e0b8b05acd7ff8e0c3106d38516b7857618c38254fa81c79ac2f43da695f4')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
