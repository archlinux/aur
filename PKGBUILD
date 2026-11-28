# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Hy4 flash Free.
pkgname=dxvk-clang-v3-bin
pkgver=3.2
pkgrel=1
pkgdesc="Argonforge Clang-built DXVK for x86-64-v3 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/dxvk-builds"
license=('MIT')
depends=('vulkan-icd-loader')
options=('!strip')
source=("dxvk-3.2-x86-64-v3.tar.zst::https://github.com/argonforge/dxvk-builds/releases/download/v3.2/dxvk-3.2-x86-64-v3.tar.zst")
sha256sums=('fd4924fc65d93efb35481a2391faae8c53542d4c41845423e8a422da7d59b33c')
package() {
  cd "${srcdir}"
  bsdtar xf dxvk-3.2-x86-64-v3.tar.zst -C "${pkgdir}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
