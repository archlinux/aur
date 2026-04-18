# Maintainer: EndlessEden <endlesseden[at]deep-rose.org>
# NOTE: this was done fast and dirty, please report any issues in the AUR comments, the email address is generally not watched.
pkgname=monado-mercury-hand-data-git
pkgver=1
pkgrel=1
pkgdesc="ONNX model files for the Monado Mercury hand tracker"
arch=('any')
license=('GPL3')
source=("https://github.com/moshimeow/mercury_steamvr_driver/raw/e3948ace94a9f2cbd949adf50ffcc082002337cc/src/steamvr_driver/mercury/resources/internal/hand-tracking-models/grayscale_detection_160x160.onnx"
        "https://github.com/moshimeow/mercury_steamvr_driver/raw/e3948ace94a9f2cbd949adf50ffcc082002337cc/src/steamvr_driver/mercury/resources/internal/hand-tracking-models/grayscale_keypoint_jan18.onnx")
sha256sums=('SKIP' 'SKIP') # Replace with actual sums once files are downloaded

package() {
    # Monado typically looks in /usr/share/monado/
    install -d "$pkgdir/usr/share/monado"
    install -Dm644 grayscale_detection_160x160.onnx "$pkgdir/usr/share/monado/grayscale_detection_160x160.onnx"
    install -Dm644 grayscale_keypoint_jan18.onnx "$pkgdir/usr/share/monado/grayscale_keypoint_jan18.onnx"
}
