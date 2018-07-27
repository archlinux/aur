# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Submitter/Contributor: KosmosElohim <bdsjunior@live.com>

pkgname=faenza-cupertino-icon-theme
epoch=1
pkgver=9
pkgrel=5
pkgdesc="Icon theme designed for Equinox GTK theme, recolored"
url="http://gnome-look.org/content/show.php/Faenza-Cupertino?content=129008"
# and https://www.gnome-look.org/content/show.php/Faenza-Cupertino-Dark?content=133677
license=('GPL3')
arch=('any')
makedepends=()
depends=('faenza-icon-theme')
optdepends=()
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1460759361/s/8d4b543e3eeb11ad730ae0330db2a72b/t/1532702321/u/129008-Faenza-Cupertino.tar.gz"
        "https://dl.opendesktop.org/api/files/downloadfile/id/1460758744/s/c1a1e847658ddc8acdb81541ed4edc23/t/1532702440/u/133677-Faenza-Cupertino-Dark.tar.gz")
sha1sums=('a691e8489a857f7e3891d7f02cbcda14f7c81a45'
          'ff1854636fcee20ab10ada5fc60a87dfb6e7e01f')

package() {
    mkdir -p "${pkgdir}/usr/share/icons"
    cp -raf "${srcdir}/Faenza-Cupertino*" "${pkgdir}/usr/share/icons/"
    chown -R root:root "${pkgdir}/usr"
}
