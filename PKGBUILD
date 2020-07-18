# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nwscript-code
pkgver=1.1.1
pkgrel=1
pkgdesc="Setup for a NWScript pseudo-IDE assembled from VSC and various development tools"
arch=('any')
url=""
license=('GPL')
depends=('code' 'astyle' 'nwnsc-bin' 'neverwinter.nim' 'nasher' 'nssnippets-bin')
optdepends=('wine')
source=('https://gitlab.com/Taro94/nwscript-code/-/archive/1.1.1/nwscript-code-1.1.1.tar.gz')
md5sums=('d82bd99da95bde1b46b0e1ba0aae20a9')
options=(!strip)

package() {
	cd nwscript-code-1.1.1
    install -Dm 755 "nwscript-code" -t "$pkgdir/usr/bin"
    install -Dm 755 "default_config.ini" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "tasks.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "settings.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "keybindings.json" -t "$pkgdir/usr/share/nwscript-code"
    #install -Dm 755 "extensions" -t "$pkgdir/usr/share/nwscript-code"
    cp -r "extensions" "$pkgdir/usr/share/nwscript-code"    
}
