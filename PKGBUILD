# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=critcmp
pkgver=0.1.7
pkgrel=1
pkgdesc='A command line tool for comparing benchmarks run by Criterion.'
url='https://github.com/BurntSushi/critcmp'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
arch=('x86_64')
license=('UNLICENSE')
makedepends=('cargo')
sha256sums=('cd56d932dba6426fe187b16ca97846e68a2ed6a5456ae3b4ce748f0e56a51377')
sha512sums=('01251b503b23e6c562611b141fd8b5c491ccd3bc52a06b80e0d7a2dcf1bc5d1c95cca8199e8e8ac28f128cd4a22fde1682836f26590b45d7e59a2f4d639a9998')
b2sums=('52f1c4d310f97aba78169297aa8476a540af5e35b8339f0e414a8a5c931a360460024f881619a6dc40b9d1b2c5434c150bcca619de4865df28cb4c53d4234ba9')

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
