# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.47.3
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

sha512sums_x86_64=('801e7613e60829d627b5153b7bf05fb25f02b70ae6a1fb649e3d60373f48a163edfacabd96f01f9ee39a1051f7888d07bc059b2896445dd888a1da7849219255')
sha512sums_i868=('cb90eed7806b31cab6c55c05cad375a633f690da87c64b4efb8cbbba88dafb2ead70e50964c9230391551756e0aada88fd840a40f54b9b483c3f446cfe55640b')
sha512sums_armv7h=('6206416a299df07703ee3449c222116e933d5e8fcc26ac49716af51481a66367ab267402686ebc292aafb662270a8dcb8e235baf722d0189e113580a1378baf8')
sha512sums_aarch64=('a66cb5a80e1c02df36d88f3a02a1c9d46f183fa0754630ea06c07e07f45bf74b86e1942c1f13c559d4083ff4f8ce37be1afc4fe7ca9f919b2c8a5d0a73a541a2')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
