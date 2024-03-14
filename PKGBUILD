# Maintainer: Rsplwe <i@rsplwe.com>

pkgname=osu-lazer-extracted-bin
_pkgname=${pkgname%-extracted-bin}
pkgver=2024.312.1
pkgrel=1
pkgdesc="A free-to-win rhythm game. Rhythm is just a *click* away!"
arch=(x86_64)
url="https://osu.ppy.sh"
license=("LicenseRef-custom")
depends=("lttng-ust2.12")
makedepends=("desktop-file-utils")
provides=(
  "osu-lazer"
  "osu-lazer-bin"
)
conflicts=(
  "osu-lazer"
  "osu-lazer-bin"
)
options=(!strip)
source=(
  "osu.AppImage::https://github.com/ppy/osu/releases/download/$pkgver/osu.AppImage"
  "start-osu"
  "mime-16.png"
  "mime-32.png"
  "mime-48.png"
  "mime-64.png"
  "mime-128.png"
  "mime-256.png"
  "mime-512.png"
  "osu-64.png"
  "osu-128.png"
  "osu-256.png"
  "osu-512.png"
  "x-osu.xml"
)
sha256sums=(
  "d5dce0b35a77fe97f878274abd0f49c68c0dfa804f04d699bf97baa877853c43"
  "7bf9e79ddacc9271da6a751b9275b4b8c2aaaa8afd2d15ac11be358a0c1a31aa"
  "477ae757c1df888c0e3a05e7cb68dbaef052cfda5939553f927afbb75bfee077"
  "ce1dba4052855b6c2b63f862fcd909c6b4ee2790e327bca8a8bb3258a6f0c77b"
  "af97cb48475f7975696e3dfe6047faa04337f5fe1baed98fee52d270115e000f"
  "9fd8c21da9f641a36717fc840cbbb47817221ab59f71189158b0a4d597106b77"
  "9b75152e4897d480d8f5dbde1c99cd9d36dce4ff6d12130f9baeb39f324052ca"
  "6f5a5c3305170d64392f68759857fd440b0a4ec57205361287a4edc675cc3b2f"
  "81ca458a68fec1ff7f5f859f11348cccdcf9839b19bb8f20da275e79f1bdec3a"
  "189ad8d66839ea36e304500826716c47a5163bdfb4d7d94f8cfd00ebc69b8579"
  "dbc80d4b41e1050a4533e6e6b48870f29556f3858778821b3435a3ce024f1a08"
  "a62c0acf5432ab06c28767dde60aca33a9c3ed4ff0cf26c8843ff07cfaa928f2"
  "f602ce5ab3d9ae0f27dd6c11b2c67445f309be02dd380b29780e9b2048ade00e"
  "bbfad62b3a6be4c9dc67cf5a430371727ebdb363b64b9e3e519c10d1826da66a"
)
b2sums=(
  "b920870e64bfc11f6ec8202c27e4c5a44477c11a399f0781992a174f898914e35b9ac0124d2b1ae57de9e4ceae200613aba77f64e6210cd5bdb711eeb414fc90"
  "539c0dcd9a66a484c986be3ba1ee27c404721b1299922ef16c544eb5e17aeb315d9bca3a79208926f2eedab12a837532b24fc06b6380be0bf1756ac42d787369"
  "902b52f363c628faa90a103d203a9b0f105ac8a4b703791d86831ac0087635c442fd39881042e0d76aa91c291b14d30e4b665bba62e425c5b2413d49c4d81f47"
  "1fff9e34349c1bdfafb58b4c21f91b13c966afd3918ec75af23f66170f42928aa2d3158814fca91a6cb2cdbe41a3ffa750b0b636a2d28abb9399da00c161a941"
  "2e455b54515fd8a93bc623622154149213953422f4c45ce0372d33eb953effe70859249edc2e480ff28e2e23b66059e52d61d4c82277de94bb2881c78e824676"
  "46c5fa330e7b17ed8be75fc449fe588501b6edc09ac84e0fc88a59b36275151b50119de327fad95771192b02a0ffa82b573ce034d2d5b8df5baba9e7cfe86ea6"
  "7191057dfa85699bb9255bd78c2c18c1f5d3e6dce397fc8d68709ea9a65ce51fb17d766f16eea4046c65f27e12e51ac72674bf0c2c2a9df1d6e4ded44c3484ad"
  "db7462d1357dc5e2431a2195e8258ff818bf5af554832e012d7de36189cb9e12d9f79c6e142c9f0c107b0961a167c62fa5ff0886d5d084feabcba3caaa7f0414"
  "35e4c5b4480c38b52a16184ecfcf9eed5190abf1ebc89b93a25cd924443a35f214d9c7687938ffdcda18b54b506bb247aaebf3422411b3990eeda944520035d3"
  "0850306c36ed5d6b10daa20cbd6438b3859860228449dd9eaacfad4c7ad59092dc276ac5255c62aad2d9990fb2e87963cb18f6d28f7223ad412a00361f9d7884"
  "c3014a69456e2f609164a497090c27477515afddc5a4248f3b8c8e42db93310c2f47f179e4f662aa4df2fcb0d83dee5521d5e0f1d5ab57c1c010203ed522631c"
  "2bc12bb226ae57a4c1b2dbeecd1378e0a7a2fe4fcec30d34d2e79bb9510da572b6b0d080fb42135d4b7c328fa3cbd3efe992a71e4254596b13909bcdd4b5b99b"
  "88652fb04a184985bae8f524fae6cf9734890cfb41a102dc950bd0d2046a2ff4aebfbdf39cb5f852af5fbfd2d0bcf5caac0fb76232646dd70a6202ce5de71049"
  "6d8cd07c7da14c9d18c68d6f1f829a3c442bf7b392bf942b7806e8cf633cdb111cab54f1cef3a1918d971ec202ba46dcaabaa57940d53a8798d806e14cb579f2"
)


prepare() {
  chmod +x osu.AppImage
  ./osu.AppImage --appimage-extract
}

package() {
  # game
  install -dm755 "$pkgdir/opt/$_pkgname"
  install -Dm755 start-osu "$pkgdir/usr/bin/start-osu"
  cp -r ./squashfs-root/usr/bin/* "$pkgdir/opt/$_pkgname"

  # desktop file
  install -Dm644 ./squashfs-root/osu!.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --remove-key="SingleMainWindow" --set-key="Version" --set-value="1.4" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="X-SingleMainWindow" --set-value="true" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="Icon" --set-value="osu-lazer" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="Exec" --set-value="start-osu %F" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="StartupWMClass" --set-value="osu!" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="StartupNotify" --set-value="true" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="MimeType" --set-value="application/x-osu-beatmap;application/x-osu-beatmap-archive;application/x-osu-skin-archive;application/x-osu-storyboard;application/x-osu-replay;application/zip;x-scheme-handler/osu" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # app icons
  install -Dm644 osu-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 osu-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 osu-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 osu-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"

  # mimetypes
  install -Dm644 mime-512.png "$pkgdir/usr/share/icons/hicolor/512x512/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-256.png "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-128.png "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-64.png "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-48.png "$pkgdir/usr/share/icons/hicolor/48x48/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-32.png "$pkgdir/usr/share/icons/hicolor/32x32/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-16.png "$pkgdir/usr/share/icons/hicolor/16x16/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 x-osu.xml "$pkgdir/usr/share/mime/packages/x-osu.xml"
}
