# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hivision-id-photos-modnet
pkgver=1.0
pkgrel=2
pkgdesc="HivisionIDPhotos pretrained model (portrait matting)"
arch=("any")
url="https://github.com/Zeyi-Lin/HivisionIDPhotos"
license=("Apache-2.0")
source=("modnet_photographic_portrait_matting.onnx::${url}/releases/download/pretrained-model/modnet_photographic_portrait_matting.onnx"
        "mnn_hivision_modnet.mnn::${url}/releases/download/pretrained-model/mnn_hivision_modnet.mnn"
        "hivision_modnet.onnx::${url}/releases/download/pretrained-model/hivision_modnet.onnx"
        "rmbg-1.4.onnx::https://huggingface.co/briaai/RMBG-1.4/resolve/main/onnx/model.onnx?download=true"
        "birefnet-v1-lite.onnx::https://github.com/ZhengPeng7/BiRefNet/releases/download/v1/BiRefNet-general-bb_swin_v1_tiny-epoch_232.onnx")
sha256sums=('07c308cf0fc7e6e8b2065a12ed7fc07e1de8febb7dc7839d7b7f15dd66584df9'
            '44cd8c229f605173765f670df0d533885c643e2d88b09e25dd4e7892b484256a'
            '7e0cb9a2a841b426dd0daf1a788ec398dab059bc039041d62b15636c0783bc56'
            '8cafcf770b06757c4eaced21b1a88e57fd2b66de01b8045f35f01535ba742e0f'
            '5600024376f572a557870a5eb0afb1e5961636bef4e1e22132025467d0f03333')

package() {
    install -Dm644 *.onnx *.mnn -t "${pkgdir}/usr/share/hivision-id-photos/hivision/creator/weights"
}
