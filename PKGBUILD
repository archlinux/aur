pkgname=batterizer
pkgver=1.0
pkgrel=1
pkgdesc="Battery level monitor; made as a lightweight alternative to Waybar"
arch=('any')
url="https://gitlab.com/matei1413/batterizer"
license=('CC0')
depends=('python' 'python-psutil')

source=("https://gitlab.com/matei1413/batterizer")
sha256sums=('7c6c3a0a8132b49d01f3855aac340e82ba54a44ce7d88e66fa2e22246e822f51'
            'a20d656e572f94c996890f1cbec3ac243d7ae14a357ef0f43868af32326b033a')

package() {
    # Install the shell script
    install -D -m755 batterizer "$pkgdir/usr/bin/batterizer"
    
    # Install the Python script
    install -D -m755 batterizer.py "$pkgdir/usr/bin/batterizer.py"
}
