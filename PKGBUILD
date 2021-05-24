# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.48.0
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

sha512sums_x86_64=('ab92af67cafb22576fe66e0830a18ebaf554b20e45836b03083e9a1a87d68ee14edafda073f65d8f84d0afd157061bb2c772defd87cd6918a394a3276a79b516')
sha512sums_i868=('184cf80ab64ec2c25f9c1b4e5a66591a1964bae0358e5d15a195359ac91e258228a096d1ee3938c65421b258cce9d18c1b525b867667acd3b0a713792e0f3eb1')
sha512sums_armv7h=('e82e0b16e77158ed90f06ca6a8564c704cbe4d40d7e5d34f8bcbfffde4c2719fa76a7be16c0fa610de7f2a67a96cf0bf09a7c21e7731f0f4fdf88381e577a6aa')
sha512sums_aarch64=('d92ce80f506fa67484748a16698a8788fe88ed9f243da75526dc0bffc62f9dcc69be7c56df89f413bef235c3d2fe59ed9b2a4d5ff63a033bee33cfd7bf6d8abe')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
}
