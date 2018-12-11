# Maintainer: Matteljay <matteljay at pm dot me>
pkgname=clipcommander
pkgver=2018.12.11
pkgrel=1
pkgdesc='Clipboard selection monitor youtube-dl GUI front-end'
arch=('any')
url="https://github.com/Matteljay/$pkgname"
license=('MIT')
depends=('python-kivy' 'python-pillow' 'xclip' 'xterm' 'youtube-dl' 'ffmpeg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matteljay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ee5d72d0d7c3c0cbd05ec8d1c979fde0757ee3032d099df91885f947d536fd62')

package() {
    cd $pkgname-$pkgver
    mkdir -vp $pkgdir/usr/bin/ $pkgdir/usr/share/
    cp -vf $pkgname.py $pkgdir/usr/bin/
    cp -vrf data/* $pkgdir/usr/share/
}

# End of file




