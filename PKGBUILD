# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=adwaita-slim-gtk-theme
pkgver=1
pkgrel=1
pkgdesc="Adwaita Slim GTK theme"
arch=(any)
url='https://github.com/godlyranchdressing/Adwaita-Slim'
license=('GPL3')
source=("${url}/releases/download/V${pkgver}/Adwaita-Slim.tar.gz"
        "${url}/releases/download/V${pkgver}/Adwaita-Slim-Dark.tar.gz")
noextract=('Adwaita-Slim.tar.gz'
           'Adwaita-Slim-Dark.tar.gz')
sha256sums=('1488c9cee960b32bc4feeca1ff1309822ccfba10b76db1bc87551d416aec1ccd'
            'f0eaeeb7b5a2a8413aa520c956ef518812d3d8d3fb356f382e6720eae6f2bc96')

package() {
    mkdir Adwaita-Slim Adwaita-Slim-Dark
    tar -xzf Adwaita-Slim.tar.gz -C Adwaita-Slim
    tar -xzf Adwaita-Slim-Dark.tar.gz -C Adwaita-Slim-Dark

    install -d "$pkgdir"/usr/share/themes
    cp -r Adwaita-Slim Adwaita-Slim-Dark "$pkgdir"/usr/share/themes
}
