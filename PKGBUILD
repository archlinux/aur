# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=cmus-rpc
pkgver=2.0.0
pkgrel=3
pkgdesc="A Discord Rich Presence for cmus player using java"
arch=('any')
url="https://github.com/0x61nas/$pkgname"
license=('MIT')
depends=('java-runtime>=17' 'cmus')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9ac11cc9475f790eb91615edca198162ad43eae2e313f0885a3f067df3afe7d8')

package() {
    install -Dm644 "./$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm777 "./$pkgname.sh" "$pkgdir/bin/$pkgname"
}
