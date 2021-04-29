# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.47.1
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

sha512sums_x86_64=('123173e4b1e5a41f2ba1a74c8d40db312fed11c2ecb69f5da0638b557337a4b48e8433b99d4e144496e1225aa8d72e3aba41993b1190f6c4ba2eeee75bb72406')
sha512sums_i868=('bb75e3859a9bab23015bb1ff07c9ffc6138ae564239d2461c35e4d42e08679b44c71dfb41278df4602d531b31acd616d0e2df58732a26b95a131fca406a6644b')
sha512sums_armv7h=('e39e3468b89f86fdda2655ecafe0bbb660ab8d60a93b80e5634c865892a352f0b7d19e0ab209a4ba606c6e9322e8d0a023aedff3ceffef66f114b63fed823ad4')
sha512sums_aarch64=('db02a01f28e06b108667d7c79d4d8e5be95388f5b394a16961c8a8692cf4f3856703a6685f907be009e0b9f8ce465114622571baa89ab4a3b268c111c44721c3')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
