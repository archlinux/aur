# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="zine"
_commit_rel="e65c447bec821c9aeb58cd739157f4a180cdb3f2" # 0.10.3
_commit="0f67cbf3ac0f3eb68915bb85c2fe6a4b59f483db" # r10
pkgver="0.10.3+r10+g${_commit::7}"
pkgrel=1
pkgdesc="Fast, Scalable, Flexible Static Site Generator (SSG)"
arch=('aarch64' 'x86_64')
url="https://zine-ssg.io"
_url="https://github.com/kristoff-it/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('zig>=0.14.1')
_pkgsrc="${pkgname}-${_commit}"
_zig_deps=(
  # zine
  "ziggy-eeb21acc0a369dca503167fe963f4f5a7eda2659.tar.gz::https://github.com/kristoff-it/ziggy/archive/eeb21acc0a369dca503167fe963f4f5a7eda2659.tar.gz"
  "zig-afl-kit-39c33d45dbe3605a9ef7cab863620d1ca78a3623.tar.gz::https://github.com/kristoff-it/zig-afl-kit/archive/39c33d45dbe3605a9ef7cab863620d1ca78a3623.tar.gz"
  "zig-lsp-kit-46e2b958c02dc4ed2d4784f8841ba7d2076da783.tar.gz::https://github.com/kristoff-it/zig-lsp-kit/archive/46e2b958c02dc4ed2d4784f8841ba7d2076da783.tar.gz"
  "scripty-131704ebf9b3557c9480248787bd7b640a6ac98d.tar.gz::https://github.com/kristoff-it/scripty/archive/131704ebf9b3557c9480248787bd7b640a6ac98d.tar.gz"
  "tracy-67d2d89e351048c76fc6d161e0ac09d8a831dc60.tar.gz::https://github.com/kristoff-it/tracy/archive/67d2d89e351048c76fc6d161e0ac09d8a831dc60.tar.gz"
  "mime-0b676643886b1e2f19cf11b4e15b028768708342.tar.gz::https://github.com/andrewrk/mime/archive/0b676643886b1e2f19cf11b4e15b028768708342.tar.gz"
  "zeit-52b100caa223d5cb1ff0d34f1b677f26e0ce8b84.tar.gz::https://github.com/rockorager/zeit/archive/52b100caa223d5cb1ff0d34f1b677f26e0ce8b84.tar.gz"
  "flow-syntax-d231728c92cb3c5a7139cb0d75a321a119b8e777.tar.gz::https://github.com/neurocyte/flow-syntax/archive/d231728c92cb3c5a7139cb0d75a321a119b8e777.tar.gz"
  "wuffs-3646d8efae3f042ccbf552263ac6b2af738bdaa7.tar.gz::https://github.com/allyourcodebase/wuffs/archive/3646d8efae3f042ccbf552263ac6b2af738bdaa7.tar.gz"
  "xcode-frameworks-8a1cfb373587ea4c9bb1468b7c986462d8d4e10e.tar.gz::https://github.com/hexops/xcode-frameworks/archive/8a1cfb373587ea4c9bb1468b7c986462d8d4e10e.tar.gz"
  "superhtml-0b9bd0e8fd6284c0cfca85f7997535fe7f051046.tar.gz::https://github.com/kristoff-it/superhtml/archive/0b9bd0e8fd6284c0cfca85f7997535fe7f051046.tar.gz"
  "supermd-e153cca96a9defea46872f9a7e980008ef6c8cdb.tar.gz::https://github.com/kristoff-it/supermd/archive/e153cca96a9defea46872f9a7e980008ef6c8cdb.tar.gz"

  # ziggy
  "known-folders-aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz::https://github.com/ziglibs/known-folders/archive/aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz"
  "zig-yaml-27f63d3d2d13ed228d8fc077635205e6c2a405c7.tar.gz::https://github.com/kubkon/zig-yaml/archive/27f63d3d2d13ed228d8fc077635205e6c2a405c7.tar.gz"
  # zig-afl-kit
  "AFLplusplus-bf7d9cc91a3897c3ed9a65b04141c87dded1bfe7.tar.gz::https://github.com/allyourcodebase/AFLplusplus/archive/bf7d9cc91a3897c3ed9a65b04141c87dded1bfe7.tar.gz"
  # zig-lsp-kit
  "diffz-a20dd1f11b10819a6f570f98b42e1c91e3704357.tar.gz::https://github.com/ziglibs/diffz/archive/a20dd1f11b10819a6f570f98b42e1c91e3704357.tar.gz"
  "zig-lsp-codegen-063a98c13a2293d8654086140813bdd1de6501bc.tar.gz::https://github.com/zigtools/zig-lsp-codegen/archive/063a98c13a2293d8654086140813bdd1de6501bc.tar.gz"
  # flow-syntax
  "tree-sitter-86dd4d2536f2748c5b4ea0e1e70678039a569aac.tar.gz::https://github.com/neurocyte/tree-sitter/releases/download/master-86dd4d2536f2748c5b4ea0e1e70678039a569aac/source.tar.gz"
  "cbor-1fccb83c70cd84e1dff57cc53f7db8fb99909a94.tar.gz::https://github.com/neurocyte/cbor/archive/1fccb83c70cd84e1dff57cc53f7db8fb99909a94.tar.gz"
  # wuffs
  "wuffs-mirror-release-c-90e4d81a6a8b7b601e8e568da32a105d7f7705e5.tar.gz::https://github.com/google/wuffs-mirror-release-c/archive/90e4d81a6a8b7b601e8e568da32a105d7f7705e5.tar.gz"
  # supermd
  "cmark-gfm-675efb13f41f1dcaebfa0e9dc42d9b504e4b5508.tar.gz::https://github.com/kristoff-it/cmark-gfm/archive/675efb13f41f1dcaebfa0e9dc42d9b504e4b5508.tar.gz"

  # AFLplusplus
  "AFLplusplus-4.21c.tar.gz::https://github.com/AFLplusplus/AFLplusplus/archive/refs/tags/v4.21c.tar.gz"
)
noextract=("${_zig_deps[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${_zig_deps[@]}")
b2sums=('86c898d4b504767decebe25d37b9c925f1fcb98a9ba235ae0c8a743a82f8f360b2386b584ab98262e0642d663a4c3849c8471c23c29609cab66818119d5b64bd'
        'f39eac1cd9b934859c43234b289c0ab4c4d7e45692c0be6f18b38178c96ad330291448408a20fdd0337bf5f49416500603df79201d34995481855dcef27dbed6'
        '4e12df0b7b70cdf8635e0b98684a019131028d623517db5fbf5ceb423e67e8c8e9e040b9e5ffa54bee30fe59e62e1b2fb2f4e8d9c4de6422160f4149eef80783'
        '5f2d84d7f50c4bd7cdd6856f39482379002bcc4117696dca095a2804fc8e458758ba838bacc41c1b2517010492058643a3e016f4ad7e2fc018f45aa098145f88'
        '67e39153400c32c4d14fbf62ad8d417f52d5ef42df81d9ada0217b4aa6a4d373b2bdb71d7e6c8b8fdee034a1fcf86767c6eef52b900c62257aa7ec4eaee099e1'
        '5a97d4082003cc843551028cde0179d05c82d3a981769166a114dab542af5b511617e07dfb77da41171a49015c7fc068fa76d8452de6093c21a83158dc4a59c9'
        '7a093a8b3eda56b7f05f406e2c55d57dc1c775321ec559f4c4f8dab8841ab6f3c689020cb2c0302428992da48d1f79813a7ea01d9ec0235affcf61841ac3e570'
        'b2cdf311b6a7b0fc248483709def6a29ccebbbaca35d568712bbf5f9e82b0c847d9cbba6e424040bc7b265ce2924404cacc2f1667a6952a10876554f333dfbd8'
        'ad1d4f4c0780f28925206b590685c455331f5d12bf03bdaee2f9146cf1b18e0cd923139c6a05f8ab785a3c05dbee57310e09a8e58229388681bbce7de3849fb9'
        '725752aa3756406bc684fb2c8e6cfaba190cd216c215068951ced378d2e5e96f73b6b654df76ab67bf722aa457e6a6ba5d5281f85a533203ae0c590d180c9fcc'
        '4cd650a055f84d1f37d47535f8a839cb1ed469cdce7f62aa2dc80fcd682f0b50dfa7128266153116c5952e381dac6b94fc1cccc64acb7d7201d670336568a20a'
        '89f0a7bbdccc174af411ba82bfa9e59b9bae6fe02e2b14e2d845d4faf904542c478776e2e72297754a2b8c9995a77ebbde9be1ccfb29530391a39fe794d79185'
        '8a08f755a00c894c8bf1296ed554454d5c8de720d32abb049fa0d4ecc46fd162f272f24f03d323fe071468de7aa85b5ccd9ee1609437843b0bee893cf17372b1'
        'c2d8a5062b1baf2868b4b6f58df9d065638a551c60bc7217a14e8395009a231603d2b2a8112fad7198ede43934f523c2b25654a54f89a088eabf72d23bd9b48d'
        'f53f2766fa1c959e0ccac5dff26160937d916cf426dd21001038db15bf6cbad88a00f17ed9c8acd11c2062e4043972ab551fb3a541d6384d7c030179a3f275a4'
        '209cb0d51b3b6151d036bbf630ed537aab7ce0c6d2e25d41b7c023f2f15c64c0ff12712ad718f3bab5887cc7d170e873966b3e9e2f3e1afdd7068ce6055c8193'
        '6f451172fd524e3cf051b228972f2ad3ab61e8391a2eb4304942d57792c3a38721e9dc7cece411f9c7005967874bd271ff434ffd1096f99b65a855884f7e34b7'
        '938e81737e9729bf64cde631cad808b77a0e2b6724d7517dd93475898011d7287d78c536a34600f1e18a57c4121c53f6123a53a08995987ab755ee67d0a12e01'
        'f3b04ef0b2d6ac6b9e79d4c80692c5a372a05bc4f30cbffee43e33dff12720f1e39180ef3318124d517b373a74639d55fb86ef65710276c99ea70acab7ee764c'
        '46e42eae3bd576a081f54a250f62bb46f563eee9e8b59b162ff87db89ff6b12543a35f0c02a857ddc7b888977f50d184fc5231a31d81fdf21a0096dda461573c'
        '5a2d52fe16ecc746d05e38623fd19a5c64d563e009b66f7333288a3f0b8ad5705b930c779ca9429769975c977aa17904a0c46c27e049e4566439c6a46fc75764'
        'f8890cc8efc54e21250fa0d8574b5f2473a2093ad61c1ca363147042635502a1c8bca6ceb43b72b08fe0a3352d63eff15e84655c5d891c4064d9cfa34a6c8649'
        'c182260ba25a8a7a87b91ece5b3ea6aafba09b3361259361d9be24b7c5dd90430403a3170ed9397edaa714a45f62de26f324aab005a27a44fffce2708bb366e5')
           
prepare() {
  cd "${srcdir}"
  for dep in "${_zig_deps[@]}"; do
    zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.41
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="build" zig build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "${pkgdir}" -type f -name '*.zig' -delete
}
