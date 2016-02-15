# Maintainer Simon Legner <Simon.Legner@gmail.com>

pkgname=soundcloud-syncer
pkgver=0.3.3
pkgrel=1
pkgdesc="Synchronize user's favorites tracks from soundcloud"
url="https://github.com/sliim/soundcloud-syncer"
depends=('python' 'python-stagger-git' 'python-pydub' 'python-dateutil' 'python-magic-git')
license=('GPLv3')
arch=('any')
source=("https://github.com/Sliim/$pkgname/archive/$pkgver.tar.gz")

build() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}

md5sums=('d666cecfa280a4c08c1401ebb495a313')
sha1sums=('6a81b3d00e96975d11821e4a64d804aff46f548a')
sha256sums=('7d77b7b6c799a4bc7701210fab0df79f825f5bf54362ac2bfa16d2b83cd8019b')
