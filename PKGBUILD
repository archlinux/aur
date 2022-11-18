pkgname=libelectron
pkgver=1.0.0
pkgrel=1
pkgdesc="A collection of npm dependencies for electron packages."
arch=('any')
license=('GPL')
depends=('npm')


package() {
    npm i electron@21.2.3 electron-context-menu@3.6.0
    npm install "https://github.com/castlabs/electron-releases#v20.0.0+wvcus" --save-dev
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r ./node_modules "$pkgdir/opt/libelectron"
}
