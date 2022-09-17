
# Maintainer: CodeCraft <codecraft07@gmail.com>
pkgname=inactiveblur-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="the inavtive blur for kde"
arch=(any)
url="https://github.com/ProjectOSX/inactiveblur"
license=('MIT')
makedepends=(git)
depends=(plasma-meta)
source=("git+$url.git")
sha256sums=('SKIP')
package() {
    install -dm0755 "$pkgdir"/usr/share/plasma/wallpapers/com.github.zren.inactiveblur
    cd inactiveblur
    cp -r  "package"/* "$pkgdir/usr/share/plasma/wallpapers/com.github.zren.inactiveblur"
}
