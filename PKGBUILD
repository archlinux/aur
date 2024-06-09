# Contributor: zenekron <zenekron@gmail.com>

pkgname=gradle-language-server
pkgver=3.12.1
pkgrel=1
pkgdesc="Microsoft's Gradle language server"
url="https://github.com/microsoft/vscode-gradle"
arch=("any")
license=('custom:MIT')
depends=("java-runtime" "bash")
source=("https://github.com/microsoft/vscode-gradle/releases/download/$pkgver/vscjava.vscode-gradle-$pkgver.vsix")
md5sums=("SKIP")


package() {
	install -d "$pkgdir/usr/share/java"
	cp -r "extension" "$pkgdir/usr/share/java/gradle-language-server"

	install -Dm 644 "extension/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
