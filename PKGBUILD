# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=fate-git
pkgver=7ad0d5f
pkgrel=1
pkgdesc="Minimal CLI JS8 software"
arch=('any')
license=('MIT')
url="https://github.com/rtmrtmrtmrtm/fate"
depends=('fftw' 'libsndfile' 'portaudio' 'liquid-dsp')
source=($pkgname::"git+$url.git")

sha256sums=('SKIP')

build() {
    cd $srcdir/$pkgname
    make
}

package() {
    cd $srcdir/$pkgname
    install -Dm755 "./fate" "$pkgdir/usr/bin/fate"
}
