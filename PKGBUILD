# Maintainer: Thulinma <jaron@vietors.com>
pkgname=subsync
pkgdesc="Automagically synchronize subtitles with video"
pkgver=0.2.4
pkgrel=1
license=('MIT')
arch=('any')
url="https://github.com/smacke/subsync"
makedepends=('python-pip')
source=("https://github.com/smacke/subsync/archive/master.zip")
md5sums=('1c1bbb4ad2870194a489043eef63f8b9')

package() {
    cd "$srcdir/subsync-master"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps subsync
}

