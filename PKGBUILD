# Maintainer: tee < teeaur at duck dot com >
pkgname=seal-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="A simple, user-friendly, and useful runtime for Luau"
arch=(x86_64)
url="https://github.com/seal-runtime/seal"
license=('MIT')
depends=('glibc' 'openssl')
provides=('seal')
conflicts=('seal')
source=("$url/releases/download/v$pkgver/seal-v$pkgver-linux-x64.tar.gz"
"$url/raw/v$pkgver/LICENSE.txt")
b2sums=('44ca3f977a16770c9ac42356452d6c548f6858e7cb6b6bbeab446f99edd14b2866820ff7b7f40aee300785fbb0db2f64413a9ef6de4630eef417cc9c36959d30'
        'b19b9e6356024b3454d2bd2c0191b994b921cca73a7817ccf9df8280c1f22bca1c4e13bc8ef4677bfd543d96127b8e40c5d4a82f4d787eac6439c3692b58175b')

package() {
    install -Dm755 seal -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
