# Maintainer: pika02 <pikakolendo02 at g-m-a-i-1 dot c0m>

pkgname=conda-bash-completion
pkgname_mamba=mamba-bash-completion
pkgver=1.7
pkgver_mamba=1.0
pkgrel=1
pkgdesc="Bash completion for conda and mamba"
provides=("conda-bash-completion"
          "mamba-bash-completion")
arch=("any")
url="https://github.com/tartansandal/$pkgname"
license=("GPL3")
depends=("bash")
source=("$pkgname-$pkgver.tar.gz::https://github.com/tartansandal/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname_mamba-$pkgver_mamba.tar.gz::https://github.com/tartansandal/$pkgname_mamba/archive/$pkgver_mamba.tar.gz")
sha256sums=('fc2c3d0181c0e3303387a575cb06ebe81cdecbcf311bba6f476588afc86216c4'
            'a811eb585d9b38290653f25660187dee688bb65f4c173306abe08125f95ad7d2')

package() {
    cd "$srcdir"
    install -Dvm644 "$pkgname-$pkgver/conda" -t "$pkgdir/usr/share/bash-completion/completions/"
    install -Dvm644 "$pkgname_mamba-$pkgver_mamba/mamba" -t "$pkgdir/usr/share/bash-completion/completions/"
} 
