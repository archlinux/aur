pkgname=audiomuse-ai-whisper-model
pkgver=5.0.0
pkgrel=1
pkgdesc='Whisper-small ONNX model bundle for AudioMuse-AI lyrics transcription'
arch=('any')
url='https://github.com/NeptuneHub/AudioMuse-AI'
license=('MIT')

source=(
  "lyrics_model_whisper.tar.gz::https://github.com/NeptuneHub/AudioMuse-AI/releases/download/v${pkgver}-model/lyrics_model_whisper.tar.gz"
)

sha256sums=('fa9f4825e1a918394c1a63b0cb7ca43ab1df8be90355ad03e7af95ee3d3f1511')

package() {
  install -d "$pkgdir/usr/share/audiomuse-ai/whisper"

  cp -a \
    "$srcdir/whisper-small-onnx" \
    "$pkgdir/usr/share/audiomuse-ai/whisper/"
}
