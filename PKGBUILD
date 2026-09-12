pkgname=silero-vad-onnx-model
pkgver=6.2.1
pkgrel=1
pkgdesc='Silero Voice Activity Detector ONNX model'
arch=('any')
url='https://github.com/snakers4/silero-vad'
license=('MIT')

source=(
  "https://files.pythonhosted.org/packages/source/s/silero-vad/silero_vad-${pkgver}.tar.gz"
)

sha256sums=('b23062b0e39fad17b1266fc23c1e7b4290219dbe82ce08510889e32f681f4b3b')

package() {
  cd "$srcdir/silero_vad-${pkgver}"

  install -Dm644 \
    src/silero_vad/data/silero_vad.onnx \
    "$pkgdir/usr/share/silero-vad/silero_vad.onnx"

  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
