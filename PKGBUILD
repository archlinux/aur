# Maintainer: Zaman Huseynli <zamanhuseyinli23@gmail.com>
# Backup contact <admin@azccriminal.space>
pkgname=plasma-system-ai-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Precompiled binary of Plasma System AI"
arch=('x86_64')
url="https://github.com/Zamanhuseyinli/Linux-AI"
license=('GPL2')
provides=('plasma-system-ai')
conflicts=('plasma-system-ai')
depends=('python')

source=("https://github.com/Zamanhuseyinli/Linux-AI/releases/download/Plasma-AI/plasma-ai")
sha256sums=('c811575bff3af7b4967433c7aae1a6c7354fee7031f5effc262b49219122ecdb')

package() {
install -Dm755 "$srcdir/plasma-ai" "$pkgdir/usr/bin/plasma-ai"
}











