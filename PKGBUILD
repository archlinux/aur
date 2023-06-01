_pkgname=anew
pkgname=anew-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="A tool for adding new lines to files, skipping duplicates"
arch=(x86_64)
url="https://github.com/tomnomnom/anew"
license=(MIT)
provides=(anew)
conflicts=(anew)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64-$pkgver.tgz"
        "$pkgname-$pkgver-README.mkd::https://raw.githubusercontent.com/tomnomnom/anew/d67d68db0d56469fdea7505c5a9209c0a465effa/README.mkd"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/tomnomnom/anew/5f5b37863008405be1e65517b7929a3244d38402/LICENSE")
b2sums=("972588b21e92c3fd5f9c18402099a02dfc026b64e64886449df7880c7788244fcc1a04c2ff9b872d736d0e6c330b9149ca807f9d137e4066cb545711e7d445a1"
        "16e16e7c6866184aef89b9ddd21a01cbb349b319afbdc90691955b867ec58903e3ba9e854d4c8147f8197245aeba58908d3203b1d494d25be6aa4fe03566e28f"
        "1bdec7b3c94d3eb22970fd8f7b08938b581f83dc2facf6c48995a6ee405c55249579843e1a8d1775bb989a4f67a053dd19885f99c9a22149ec2e7585ec8fbee6")

package() {
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $pkgname-$pkgver-README.mkd "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
