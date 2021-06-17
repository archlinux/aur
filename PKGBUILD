# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.49.0
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

sha512sums_x86_64=('45bddef352af0f52ef0639800d3600521a894abcbb0f68cd697c0da9ddcfe1b998e1cd8dc0a90b43d92e1cc6b743493aebe41f3a0f3daa6af1732e36079dbffc')
sha512sums_i868=('f0aa993b80aad3f70ff6cb725298bf425d7ca49c576fc09d0f5efa5ef17a9c6dc9e191ee11ec24deff81304edac809ff8b91705d1266def89877e694635c22f1')
sha512sums_armv7h=('3433bbb3ff395ba3b107df9006facc374105d98b5c8c69676995d5caa9311f12332b069d53425e784d73910f3eb633ed6a05a58379494ced709e51bdd79d03d2')
sha512sums_aarch64=('c21090c3d13196c8502ddc52ef46b49306cf4ff40558769e1abb3303fcbfc733998fb9eb9cf2da136ffc218b3a0bc3aac010aad4fd9858168b6c70703b7a3d27')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
