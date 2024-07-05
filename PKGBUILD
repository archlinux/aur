pkgname=batterizer
pkgver=1.0
pkgrel=1
pkgdesc="Battery level monitor"
arch=('any')
url="https://gitlab.com/snake9132037/batterizer"
license=('MIT')
depends=('python' 'python-psutil')

source=("batterizer"
        "batterizer.py")

package() {
    # Install the shell script
    install -D -m755 batterizer "$pkgdir/usr/bin/batterizer"
    
    # Install the Python script
    install -D -m755 batterizer.py "$pkgdir/usr/bin/batterizer.py"
}
