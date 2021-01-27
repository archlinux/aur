# Maintainer: Nathan Kessler <nathant93@gmail.com>
pkgname=dot-templater
pkgver=1.5.0
pkgrel=1
pkgdesc="Templates a folder of dotfiles, supporting feature flags and string substitutions"
arch=( 'x86_64')
url="https://github.com/kesslern/dot-templater"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cargo')
source=(""https://github.com/kesslern/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"")
md5sums=('SKIP')

package() {
        install -Dm 755 ${pkgname}/${pkgname} -t "${pkgdir}/usr/bin"
        install -Dm644 ${pkgname}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
