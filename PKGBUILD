# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=yacreader-bin
pkgver="9.12.0"
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection."
arch=(x86_64)
url="https://github.com/YACReader/yacreader"
license=(GPLv3)
depends=(poppler-qt5 libunarr)
makedepends=()
optdepends=()
conflicts=(yacreader yacreader-git yacreader-poppler yacreader-poppler-git)
provides=(yacreader)
source=("https://download.opensuse.org/repositories/home:/selmf/Debian_Unstable/amd64/yacreader_${pkgver}-1_amd64.deb")
sha256sums=("7c0521624986caa19d1164599d47c36085ded17ae5021a85a42cc4aa36f91a3a")

package() {
  cd "$srcdir"
  tar xvf data.tar.xz >/dev/null

  install -Dm755 "usr/bin/YACReader" "${pkgdir}/usr/bin/YACReader"
  install -Dm755 "usr/bin/YACReaderLibrary" "${pkgdir}/usr/bin/YACReaderLibrary"
  install -Dm755 "usr/share/applications/YACReader.desktop" "${pkgdir}/usr/share/applications/YACReader.desktop"
  install -Dm755 "usr/share/applications/YACReaderLibrary.desktop" "${pkgdir}/usr/share/applications/YACReaderLibrary.desktop"
  install -Dm644 "usr/share/doc/yacreader/README.gz" "${pkgdir}/usr/share/doc/yacreader/README.gz"
  install -Dm644 "usr/share/doc/yacreader/changelog.Debian.gz" "${pkgdir}/usr/share/doc/yacreader/changelog.Debian.gz"
  install -Dm644 "usr/share/doc/yacreader/changelog.gz" "${pkgdir}/usr/share/doc/yacreader/changelog.gz"
  install -Dm644 "usr/share/doc/yacreader/copyright" "${pkgdir}/usr/share/doc/yacreader/copyright"
  install -Dm644 "usr/share/icons/hicolor/scalable/apps/YACReader.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/YACReader.svg"
  install -Dm644 "usr/share/icons/hicolor/scalable/apps/YACReaderLibrary.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/YACReaderLibrary.svg"
  install -Dm644 "usr/share/man/man1/YACReader.1.gz" "${pkgdir}/usr/share/man/man1/YACReader.1.gz"
  install -Dm644 "usr/share/man/man1/YACReaderLibrary.1.gz" "${pkgdir}/usr/share/man/man1/YACReaderLibrary.1.gz"
  install -Dm644 "usr/share/yacreader/languages/yacreader_de.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_de.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_en.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_en.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_es.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_es.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_fr.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_fr.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_it.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_it.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_nl.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_nl.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_pt.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_pt.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_ru.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_ru.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_tr.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_tr.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_zh_CN.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_zh_CN.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_zh_HK.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_zh_HK.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreader_zh_TW.qm" "${pkgdir}/usr/share/yacreader/languages/yacreader_zh_TW.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_de.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_de.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_en.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_en.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_es.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_es.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_fr.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_fr.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_it.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_it.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_nl.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_nl.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_pt.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_pt.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_ru.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_ru.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_tr.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_tr.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_zh_CN.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_zh_CN.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_zh_HK.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_zh_HK.qm"
  install -Dm644 "usr/share/yacreader/languages/yacreaderlibrary_zh_TW.qm" "${pkgdir}/usr/share/yacreader/languages/yacreaderlibrary_zh_TW.qm"
}
