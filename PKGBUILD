# Maintainer: Nguyen Hoang Tan <devaligator1004@gmail.com>
pkgname=deeptitle
pkgver=1.0.0  # Replace with the actual version of your script
pkgrel=1
pkgdesc="DeepTitle - An automatic subtitle translator"
arch=('any')
url="https://github.com/Dev-Aligator/deeptitle"  # Replace with your project's URL
license=('MIT')  # License of your project

#source=("$pkgname-$pkgver::https://github.com/Dev-Aligator/DeepTitle/archive/v$pkgver.tar.gz")
source=("git+https://github.com/Dev-Aligator/deeptitle.git")
sha256sums=('SKIP')  # You can skip this for now

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 models.py "$pkgdir/usr/bin/deeptitle-packages/models.py"
    install -Dm755 main.py "$pkgdir/usr/bin/deeptitle-packages/main.py"
    install -Dm755 scripts.sh "$pkgdir/usr/bin/$pkgname"  # Install 'scripts.sh' as a wrapper script
}
