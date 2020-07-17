# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nwscript-code
pkgver=1.0.0
pkgrel=1
pkgdesc="Setup for a NWScript pseudo-IDE assembled from VSC and various development tools"
arch=('any')
url=""
license=('GPL')
depends=('code' 'nwnsc-bin' 'neverwinter.nim' 'nasher' 'nssnippets-bin')
optdepends=('wine')
source=('https://gitlab.com/Taro94/nwscript-code/-/archive/1.0.0/nwscript-code-1.0.0.tar.gz')
md5sums=('8d181281061eaa70937832816dba15a5')
options=(!strip)

package() {
	cd nwscript-code-1.0.0
    install -Dm 755 "nwscript-code" -t "$pkgdir/usr/bin"
    install -Dm 755 "default_config.ini" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "tasks.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "settings.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "keybindings.json" -t "$pkgdir/usr/share/nwscript-code"
    #install -Dm 755 "extensions" -t "$pkgdir/usr/share/nwscript-code"
    cp -r "extensions" "$pkgdir/usr/share/nwscript-code"    
}
