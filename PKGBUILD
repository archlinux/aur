# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.47.0
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

sha512sums_x86_64=('f85a71b93f75963fe65e8a44b5ee7893c4ab112b486c8bf4c4189da7c9dbeb5150a5b6fdca4ca511c0fc5f8a28f746b26c7d81eef3c4f58fdc588cb2d615885d')
sha512sums_i868=('e980e1a4b9b321c276414ff60feb61f1efac6c35f5bbb4166c7d38d8c08ac512721047b3809e5a3f242fe38482a0d43ea8f1b380aff6a62a5a8ff9f6509ae9d0')
sha512sums_armv7h=('f559c09be73e3ddf1ef9613c2e1640eb4a2cf06da5030e25fa0377daf7be661c7b12f5d6fa8d446c1fca9b74c47432e432bc608b665e75cc07c3b6f22abc586d')
sha512sums_aarch64=('2ea2cf133eaef195107b502af59fa875cb1114967fa68ae8f5de1a7e1e1150cf9159a64dc9d22f1b52f1e32042a8989f36992011a84b711218c163cbdd91a521')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
