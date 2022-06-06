https://cbiit-download.nci.nih.gov/nbia/releases/ForTCIA/NBIADataRetriever_4.3/nbia-data-retriever-4.3.deb

# Maintainer: François Pelletier <francois@jevalide.ca> -> https://git.francoispelletier.org

pkgname=nbia-data-retriever
pkgver=4.3
pkgrel=1
pkgdesc="NBIA Data Retriever is an app that facilitates downloading images from the National Biomedical Imaging Archive (NBIA) and The Cancer Imaging Archive (TCIA)"
url="https://wiki.cancerimagingarchive.net/display/NBIA/Cancer+Imaging+Archive+User%27s+Guide#CancerImagingArchiveUser%27sGuide-DownloadingStudyData"
arch=(x86_64)
source=("https://cbiit-download.nci.nih.gov/nbia/releases/ForTCIA/NBIADataRetriever_4.3/nbia-data-retriever-4.3.deb")
license=('BSD-3-Clause')
depends=('java-runtime>7')
sha256sums=('293dedaf7352709f8bf952739c24d96cbe38fb58f102285fba09e2cc8c6ff250')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  chown root:root -vR "${pkgdir}/"
}
