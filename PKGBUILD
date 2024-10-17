# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hivision-id-photos-resnet
pkgver=1.0
pkgrel=1
pkgdesc="HivisionIDPhotos pretrained model (face detection)"
arch=("any")
url="https://github.com/Zeyi-Lin/HivisionIDPhotos"
license=("Apache-2.0")
source=("${url}/releases/download/pretrained-model/retinaface-resnet50.onnx")
sha256sums=('40f825cf7dd0a88b26fb61db9a3aaedc2cad35162091113f4017b3c26a4f792d')

package() {
    install -Dm644 *.onnx -t "${pkgdir}/usr/share/hivision-id-photos/hivision/creator/retinaface/weights"
}
