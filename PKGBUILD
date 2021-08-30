# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.3.0
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

sha512sums_x86_64=('7cc9e50d11c797fac96a18e0cb0aab436051a82baca7984b7c730f78fec149c541520a04c27f555d6334944f00606923e461a61e016102524beb6f67ca84e213')
sha512sums_i868=('2f18bf8620a5214660b6f1fa0301b580876f5d512746acae723c099a8de4664557a07a63055dedcfc2ec0a7411e968ff6ac57adb721e8ab454865d7eab8f307b')
sha512sums_armv7h=('60306a85e3e9a58035d2addf8c2af5eb582c26e49460ff2108f4b93ab6955fe19b1aefc4313c78e4bda6a84b8d24a0485413104c2c82b84b3ae121a7403087ae')
sha512sums_aarch64=('eb034bb576a7e7fa09748bbf63daf1d55afa5be3cbef69e898559b25880b7df61a8983cfca441a19afd3328b55123dd65d34480bb8bc2b55bfdca7b0c3671b76')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
