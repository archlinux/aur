# Maintainer: Matteljay <matteljay at pm dot me>
pkgname=clipcommander
pkgver=2019.01.12
pkgrel=1
pkgdesc='Clipboard selection monitor youtube-dl GUI front-end'
arch=('any')
url="https://github.com/Matteljay/$pkgname"
license=('MIT')
depends=('python-kivy' 'python-pillow' 'xclip' 'xterm' 'youtube-dl' 'ffmpeg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matteljay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('452b1761d630b848470a39788efbd59a3c86b007fac065da264ad023403d2b5d')

package() {
    cd $pkgname-$pkgver
    mkdir -vp $pkgdir/usr/bin/ $pkgdir/usr/share/
    cp -vf $pkgname.py $pkgdir/usr/bin/
    cp -vrf data/* $pkgdir/usr/share/
}

# End of file




