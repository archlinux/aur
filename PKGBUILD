pkgname=audiomuse-ai-clap-text-model
pkgver=5.0.0
pkgrel=1
pkgdesc='CLAP text encoder ONNX model exported for AudioMuse-AI'
arch=('any')
url='https://github.com/NeptuneHub/AudioMuse-AI'
license=('CC0-1.0')

_model_tag="v${pkgver}-model"

source=(
  "clap_text_model-${pkgver}.onnx::https://github.com/NeptuneHub/AudioMuse-AI/releases/download/${_model_tag}/clap_text_model.onnx"
)

sha256sums=('200d48f3905ff1f272af5006dd9851f94071a7dde4eafd9c07bc09c5ac65a714')

package() {
  install -Dm644 "$srcdir/clap_text_model-${pkgver}.onnx" \
    "$pkgdir/usr/share/audiomuse-ai/clap/clap_text_model.onnx"
}
