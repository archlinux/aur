pkgname=configcat-cli-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Configcat cli binary distribution"
arch=('x86_64')
url="https://github.com/configcat/cli"
license=('MIT')
provides=('configcat-cli')
source=("https://github.com/configcat/cli/releases/download/v${pkgver//_/-}/configcat-cli_${pkgver//_/-}_linux-x64.tar.gz"
        )
sha256sums=('c9201ce80d589324fc2cf863f2352de377651d039b6aa5e0c79909eeb9f05731')
options=("!strip")

package() {
	install -d "$pkgdir/usr/bin/"
	install -D configcat "$pkgdir/usr/bin/"
}
