# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Submitter/Contributor: KosmosElohim <bdsjunior@live.com>

pkgname=faenza-cupertino-icon-theme
epoch=1
pkgver=9
pkgrel=6
pkgdesc="Icon theme designed for Equinox GTK theme, recolored"
url="http://gnome-look.org/content/show.php/Faenza-Cupertino?content=129008"
# and https://www.gnome-look.org/content/show.php/Faenza-Cupertino-Dark?content=133677
license=('GPL3')
arch=('any')
makedepends=()
depends=('faenza-icon-theme')
optdepends=()
source=("129008-Faenza-Cupertino.tar.gz::https://www.opendesktop.org/p/1012542/startdownload?file_id=1460759361&file_name=129008-Faenza-Cupertino.tar.gz&file_type=application/x-gzip&file_size=259707&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1460759361%2Fs%2Fcca6b18ed9013a26ec1ee4b59cd4d28f%2Ft%2F1532709546%2Fu%2F%2F129008-Faenza-Cupertino.tar.gz"
        "133677-Faenza-Cupertino-Dark.tar.gz::https://www.opendesktop.org/p/1012259/startdownload?file_id=1460758744&file_name=133677-Faenza-Cupertino-Dark.tar.gz&file_type=application/x-gzip&file_size=205873&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1460758744%2Fs%2F8a15d5631eca905e04cb508da9f9167a%2Ft%2F1532709543%2Fu%2F%2F133677-Faenza-Cupertino-Dark.tar.gz")
sha1sums=('a691e8489a857f7e3891d7f02cbcda14f7c81a45'
          'ff1854636fcee20ab10ada5fc60a87dfb6e7e01f')

package() {
    mkdir -p "${pkgdir}/usr/share/icons"
    cp -raf "${srcdir}/"Faenza-Cupertino* "${pkgdir}/usr/share/icons/"
    chown -R root:root "${pkgdir}/usr"
}
