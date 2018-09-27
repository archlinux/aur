# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Submitter/Contributor: KosmosElohim <bdsjunior@live.com>

pkgname=faenza-cupertino-icon-theme
epoch=1
pkgver=9
pkgrel=7
pkgdesc="Icon theme designed for Equinox GTK theme, recolored"
url="http://gnome-look.org/content/show.php/Faenza-Cupertino?content=129008"
# and https://www.gnome-look.org/content/show.php/Faenza-Cupertino-Dark?content=133677
license=('GPL3')
arch=('any')
makedepends=()
depends=('faenza-icon-theme')
optdepends=()
# Rehosting due to issues with gnome-look/opendesktop.org not liking scripting.
# Original sources:
# https://www.gnome-look.org/p/1012542/
# https://www.gnome-look.org/p/1012259/
source=("https://chriswarrick.com/pub/faenza-cupertino-icon-theme/129008-Faenza-Cupertino.tar.gz"
        "https://chriswarrick.com/pub/faenza-cupertino-icon-theme/133677-Faenza-Cupertino-Dark.tar.gz")
sha1sums=('a691e8489a857f7e3891d7f02cbcda14f7c81a45'
          'ff1854636fcee20ab10ada5fc60a87dfb6e7e01f')

package() {
    mkdir -p "${pkgdir}/usr/share/icons"
    cp -raf "${srcdir}/"Faenza-Cupertino* "${pkgdir}/usr/share/icons/"
    chown -R root:root "${pkgdir}/usr"
}
