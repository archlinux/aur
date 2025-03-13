# Maintainer: jpy794 <jpy794@hotmail.com>
pkgname='cuda-checkpoint-bin'
pkgver='570.124.04'
pkgrel='1'
pkgdesc='Checkpoint and restore the CUDA state of a single Linux process.'
arch=('x86_64')
depends=('nvidia-utils>=550')
license=('custom')
url='https://github.com/NVIDIA/cuda-checkpoint'
source=('https://github.com/NVIDIA/cuda-checkpoint/raw/a40358fd0b57468c879f38ffd3781d0c298661e0/bin/x86_64_Linux/cuda-checkpoint')
sha512sums=('7cab8e71a7bc8e35262eb4d6df8fc4986aedf5358dbc003e7a6215d5b60fea92d98c34be986480d46ebdf8ab6e79a998c3b71e23c136015561f55e790279e8d3')
options=('!strip' '!debug')

package() {
    install -Dm755 "$srcdir/cuda-checkpoint" "$pkgdir/usr/bin/cuda-checkpoint"
}
