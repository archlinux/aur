# Maintainer: Stokes <jesusmanuelgonzalezmeneses18@gmail.com>

pkgname=conversor-dolphin
pkgver=1.3.1
pkgrel=1
pkgdesc="Dolphin (KF6) service menu to manage PDF and convert PDF, images, SVG, audio, video, e-books and office files"
arch=('any')
url="https://github.com/13Stokes31/conversor-dolphin"
license=('MIT')
depends=('poppler' 'kdialog')
optdepends=('ghostscript: comprimir PDF'
            'img2pdf: convertir imágenes a PDF (sin pérdida)'
            'imagemagick: convertir entre formatos de imagen (JPG/PNG/WebP/AVIF/TIFF, HEIC…)'
            'libheif: leer HEIC/HEIF y escribir AVIF en imagemagick'
            'ffmpeg: convertir audio y vídeo'
            'librsvg: convertir SVG a PNG/PDF'
            'calibre: convertir libros electrónicos (EPUB/MOBI/AZW…) a PDF'
            'libreoffice-still: convertir documentos de oficina a PDF (o libreoffice-fresh)'
            'ocrmypdf: OCR, añadir capa de texto buscable a un PDF (AUR)'
            'tesseract-data-spa: datos de OCR en español')
install="$pkgname.install"
source=("pdf-unir.sh"
        "pdf-dividir.sh"
        "pdf-convertir.sh"
        "img-a-pdf.sh"
        "office-a-pdf.sh"
        "img-convertir.sh"
        "audio-convertir.sh"
        "video-convertir.sh"
        "svg-convertir.sh"
        "ebook-a-pdf.sh"
        "conversor-dolphin-pdf.desktop"
        "conversor-dolphin-unir.desktop"
        "conversor-dolphin-imagenes.desktop"
        "conversor-dolphin-oficina.desktop"
        "conversor-dolphin-audio.desktop"
        "conversor-dolphin-video.desktop"
        "conversor-dolphin-svg.desktop"
        "conversor-dolphin-ebook.desktop"
        "Makefile"
        "LICENSE")
sha256sums=('72b6d7c9f928559a8afc322cc98a2958b83b53f262381e77badf2c279b1c39ce'
            '9ea9e66351b1abe7f9d694cb81f285e575ce2f75297c652311790fa64b79acdb'
            'cd57636ee67c12e37ba5016337e3b689384a0012998466e5b4aff460a34f0e75'
            '3f7d2e5034ffebaceac5242095c4369fa0ec4c00c4bb64053990ab01b65a5cdd'
            '363b0996123e488ebb636f7059302bcbfb96f208912f5487e733cdc276fc5b89'
            '66c41a1b299c3896c2b61e170894c070e0870534992e27ae0cb7ebe770b680c0'
            '9817dbe692317b2f8c691e94ab18de7ca88310bb51567ab85e2397ecddae90d2'
            '836ba462fa0337777955d30309a29a245d1ef4fd10498006ac0b3e5c6c56f5ce'
            '2b0fdc940770d932cb0216ad424802141bd592971b513dea34b797a1b232b0c1'
            'f64dd99c723e3666f5c74fe8c61acd64aeaeb99e0f207c0af0f32dc17dab26b0'
            '338067a69134ce47784d1dcb48b26963c236c871ee0ae9df67402bae9a00a99b'
            '8dd67cc4008f86254ff6a93732ec9c7138d1e8f75324d880663f5a9a87abe5d0'
            '8e3a51f2a8e6a6598f134c4d22f8a6308deecf63a37cc1265fe8b81baf0bc4a8'
            '7cc95ce2fea51f303510590e98451b4c39203234a8773aca4ed3517867ab7e5d'
            '68c627abd580aa3a303ba507a1c3b988593e2da5c9a69719f91db58c28a0c566'
            '38e592858052c5213f104d3d956de7a12f71b9dcb802786f534073868091f22b'
            'dcbc0e56a803d93d8789111172f4c84617b8db5ef341d89c028d12b8805effd3'
            '2fd4ef78aec46462df2cfe72f580dee227e1706676d8ae9443ac990300a6e427'
            '15d049b7c6267ade3114f711448da99d9ef2972deedce9ae5d515f5bb8a6baa0'
            'b6b66ed3de09e5429cd6c6e7ebb2ad74f77ea2e9e15009063b0741668d2b45f8')

package() {
    make -C "$srcdir" DESTDIR="$pkgdir" PREFIX=/usr install
}
