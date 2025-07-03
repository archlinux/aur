# Maintainer: Kamlendra Singh <kamlendrax@gmail.com>
pkgname=mvbot
pkgver=1.0.0
pkgrel=1
pkgdesc="System UUID Matrix Anti-Spam Tool"
arch=('x86_64')  
url="https://github.com/kamlendras/mvbot"
license=('MIT')  
depends=()  
source=("https://github.com/kamlendras/mvbot/releases/download/stable/mvbot")
sha256sums=('c7e51c017523277ee34393dfdf08437e3a4c4840e57b170b16ac61efb917fa41')  

package() {
    cd "$srcdir"
    
    # Install binary
    install -Dm755 mvbot "$pkgdir/usr/bin/mvbot"
    
    # Install additional files if needed
    # install -Dm644 config.conf "$pkgdir/etc/your-package/config.conf"
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
