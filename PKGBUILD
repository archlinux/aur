# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Nicola Squartini <tensor5@gmail.com>

_chromiumver=61.0.3163.100
pkgname=electron2
pkgver=2.0.18
pkgrel=4
pkgdesc='Build cross platform desktop apps with web technologies'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt'
         'libxss' 'minizip' 'nss' 're2' 'snappy')
makedepends=('clang' 'git' 'gperf' 'harfbuzz-icu' 'jsoncpp' 'libnotify' 'lld'
             'llvm' 'ninja' 'npm' 'pciutils' 'python2' 'wget' 'yasm')
optdepends=('gvfs: file deletion support (gvfs-trash)'
            'kde-cli-tools: file deletion support (kioclient5)'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=("git+https://github.com/electron/electron.git#tag=v${pkgver}"
        'git+https://github.com/boto/boto.git'
        'breakpad::git+https://github.com/electron/chromium-breakpad.git'
        'git+https://chromium.googlesource.com/chromium/src/tools/grit.git'
        'electron-gyp::git+https://github.com/electron/gyp.git'
        "git+https://github.com/electron/libchromiumcontent.git"
        'native_mate::git+https://github.com/electron/native-mate.git'
        'git+https://github.com/electron/node.git'
        'pdf_viewer::git+https://github.com/electron/pdf-viewer.git'
        'git+https://github.com/kennethreitz/requests.git'
        'google-breakpad::git+https://chromium.googlesource.com/breakpad/breakpad/src'
        "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${_chromiumver}.tar.xz"
        'electron2.desktop'
        'default_app-icon.patch'
        'dont-bootstrap-libchromiumcontent.patch'
        'dont-update-submodules.patch'
        'dont-use-sysroot.patch'
        'no-whole-archive.patch'
        'use-system-libraries-in-node.patch'
        'use-system-ffmpeg.patch'
        'breakpad-glibc2.26.patch'
        'breakpad-glibc2.30.patch'
        'gyp-no-rpath.patch'
        'libchromiumcontent-fix-v8-patches.patch'
        'libchromiumcontent-settings.patch'
        'libchromiumcontent-sort-filenames.patch'
        'libchromiumcontent-static-library-only.patch'
        'libchromiumcontent-use-system-tools.patch'
        'chromium-atk-r1.patch'
        'chromium-gn-bootstrap-r14.patch'
        'chromium-include-functional.patch'
        'chromium-use-system-ffmpeg.patch'
        'chromium-use-system-minizip.patch'
        'chromium-use-system-re2.patch'
        'chromium-SIOCGSTAMP.patch'
       )
noextract=("chromium-${_chromiumver}.tar.xz")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '4dfd3a493ceb7c605eeab6f387541273d529e8b935a6104927e34836469aedcfcbb4a1154591585621d5c2e842e68701d32328acba842f840a20498822165f78'
            '59d8f3cef8f38d2d212c509ced0dbd5a09a6821e8167761ebf826fe8866f2f228ac83bca76b022fd48cb853bde43eabced4065247ae444b8128fab4bd3e7c4ff'
            '6189c850c8dc07c4e517d5b1e3b4771703e1b3d267ef7edc0cf57aa154f4d865a87255a4d28a554db9e8068113ccf851664cb7be04c8d07684e50bacb1021725'
            'b002bb96d38875876d09ad5ceb76843b306031c470ba24aace6cbc5b8a22774f44b5c0e4a99bf807737e25f57254d14865934694114a9f4551453cc6c560063a'
            '22d2d3605a49a72cf7e12e4f1cdadb6e327a7487eed47eeb04a4213cf6dcc73c47d93cdea85a767a11181debc37e952f5e4685f9fae1debd4a1a1a10ac188e8c'
            '1bda751a86a1c07f87e6631469701ebab5b1ce8f4052fcf666e8fc3bc645199a4df47fe7e75aed092ff23e17c2b9c4f286a60c2428fd72d0e6cae7a5d0507de4'
            'e5a21eea33f24e82b250ad903ae9f6f40a71876661391b7bb2b749edb3470e1256ecb06aba0541f4da4cbaf9be2df90eb2b9e588566138fdb63d92a9aca60936'
            'baf921c2970e09cbc98781bdad9625c6926eaeb197cca5588cb3444db4422d18949a611f8d66452c4acff1c5f2cb0ba67cac3f85214a97c91c232778e1e9dce2'
            '89966d7b6eba2a588898cb69a2397ff87ad8936dc1e99e82668b312b6423794e3d6c41ee9defa8773e8fa947c6e873bc23928c719d908687eb28f78df54d6a2a'
            '2dd594a07f8ce62a7706a0365d764ab3ee3cc2d050d6ae4460db3152269e84f43516438a4f48f47fc54fe758a70c462baed6b7defa8b2bd277e67cb1bae8da12'
            '8d9a06f10ecc3a4a54fce8d4ca4d9fce338705c3f43bf4e393377e0cb21710711f8fd0a1e211b01942776fc7117e9d8ecf51609b61d77f42579513dca2c84454'
            'd77a2045f03c1327eb78517028c083e8965297a41d5a81df8c7dac5a8500aa242faa644a38be5d12914b68ba3a0b944c1bfe6dbfd7b88b1a0aeeec1d87a1619a'
            '79baa5d144733442cd839d7ee195b11b4e8ee19cd77e37c8ca1def18e2ffa30b8e63b8e4e2688944d55cbea048107f0cf209547ea14c49b4585c936249016c43'
            'f7b354b1672760c85b278a900e8398c54c31663148091a59ca63bfcb9739a0071991111c6ce790fcfc072aff30fe8c52309c55cc39ede1f44ba503d712e4fc3d'
            '8da75b16f3fc39e828b94fe9bf013a2fd180a81a9a34a8511a99e62e8d2a714ced24d94ef643561e0c88c27868d8eaa643e19003cbfa293451fc15dd75f5801f'
            'efeb0358488a7402d380a4cab736efd4c626171659f1fd627b48b3f44a873d6ef149f8b00a03f6eae4a775d3fe77887e7e8b9ff2753f60d16a94e4f342687384'
            '45c9bcc588d8fc5dd5c5fde17ef5114f0c9717c965a7c3009bfa6e79ba6a3fc9a19eab3451b72e5de75535d62391a3e2660f0aab329d7ec137605593915f4010'
            '5722c571ffc384e0e226342d170e29109bf45761dcd7202b2fe6572795e0a04bd0521b1120eb2247c2a84bed0e63f47a71d25802528992ee4f976b348fb5c8f6'
            'd297728681538fd6d6d48da4477e6e42b0ac1585a243dca60c0d9896387a1bf17770aa70966344c8d3551b774cbea6d6acbeaa0dbbfc3c17367dda5daa912297'
            '2906e565804cb42ef3370521683d01e4cb083f0c7d5b02692101afb56616838b3dda8d05d43d0942ea3b7b7528985a1470719574356d37416427b56409c52a7f'
            'd549c33d3499737f7d4dd2f87b8f08e90687d107248d9729676b7a0ea8562df3dd0430aa6776e4cb6ca793c2d93a726ce7b8da22703eef3f91aeb42b7e852240'
            'eace29bd99f7167ac2e5b7499560ec7e6c205eeee8fd0adef8cc7de3cef5058f9852dd2cc20946d637ed479d25b270c35d52de6f104f41000faa36dc018f63aa'
            '5552e8918462f6c3a4e1baef3c22b57d70c732766945ea0b39f63df7d7b8fca9646f1f9b28b0528fa586799842c949298fc97e1041875da0ca1aacff046f6c9b'
            '764f9d564863098b20fb59c3eac2cf37a5ec725e4113ef7c1b81f91242c1c3ea994afead7fc9b70dbcdaff3d108068167e7b4dc4515de25dc5c18005da8ec55e')

_system_libs=('ffmpeg'
              'flac'
              'harfbuzz-ng'
#              'icu'
              'libevent'
              'libjpeg'
#              'libpng'
#              'libvpx' # Not compatible with libvpx 1.8.0
              'libwebp'
              'libxml'
              'libxslt'
              're2'
              'snappy'
              'yasm'
              'zlib'
             )

prepare() {
  ln -s electron-gyp gyp

  cd "${srcdir}"/electron

  patch -Np1 -i "${srcdir}"/default_app-icon.patch  # Icon from .desktop file
  patch -Np1 -i "${srcdir}"/use-system-libraries-in-node.patch
  patch -Np1 -i "${srcdir}"/use-system-ffmpeg.patch
  patch -Np1 -i "${srcdir}"/dont-update-submodules.patch
  patch -Np1 -i "${srcdir}"/dont-use-sysroot.patch
  patch -Np1 -i "${srcdir}"/dont-bootstrap-libchromiumcontent.patch
  patch -Np1 -i "${srcdir}"/no-whole-archive.patch

  # Add extra libraries for unbundling, remove unneeded libraries
  sed -e "s/'-lexpat',/'-lexpat', '<\!@(pkg-config --libs-only-l libavcodec libavformat libavutil libevent flac harfbuzz-icu jsoncpp minizip libpulse vpx libwebpdemux libwebpmux libxml-2.0 libxslt zlib)', '-ljpeg', '-lre2', '-lsnappy', '-latomic',/" \
      -e 's/ gconf-2.0//' \
      -i brightray/brightray.gyp

  mkdir -p "${srcdir}"/python2-path
  ln -sf /usr/bin/python2 "${srcdir}/python2-path/python"

  for m in boto breakpad gyp libchromiumcontent native_mate node pdf_viewer requests; do
    git submodule init vendor/${m}
    git config submodule.vendor/${m}.url "${srcdir}/${m}"
  done
  git submodule update

  cd "${srcdir}"/electron/vendor/pdf_viewer
  git submodule init vendor/grit
  git config submodule.vendor/grit.url "${srcdir}/grit"
  git submodule update

  cd "${srcdir}"/electron/vendor/breakpad
  git submodule init src
  git config submodule.src.url "${srcdir}"/google-breakpad
  git submodule update
  patch -Np1 -i "${srcdir}"/breakpad-glibc2.26.patch
  patch -Np1 -i "${srcdir}"/breakpad-glibc2.30.patch

  cd "${srcdir}"/electron/vendor/gyp
  # Remove a useless $ORIGIN/lib/ rpath from the electron binary
  patch -Np1 -i "${srcdir}"/gyp-no-rpath.patch

  cd "${srcdir}"/electron/vendor/libchromiumcontent
  patch -Np1 -i "${srcdir}"/libchromiumcontent-fix-v8-patches.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-settings.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-sort-filenames.patch  # deterministic build
  patch -Np1 -i "${srcdir}"/libchromiumcontent-use-system-tools.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-static-library-only.patch
  rm patches/third_party/ffmpeg/001-build_gn.patch  # Use system ffmpeg
  echo 'Extracting chromium source...'
  tar -xJf "${srcdir}"/chromium-${_chromiumver}.tar.xz
  mv chromium-${_chromiumver} src
  cd src
  patch -Np1 -i "${srcdir}"/chromium-atk-r1.patch
  patch -Np1 -i "${srcdir}"/chromium-gn-bootstrap-r14.patch
  patch -Np1 -i "${srcdir}"/chromium-include-functional.patch
  patch -Np1 -i "${srcdir}"/chromium-use-system-ffmpeg.patch
  patch -Np1 -i "${srcdir}"/chromium-use-system-minizip.patch
  patch -Np1 -i "${srcdir}"/chromium-use-system-re2.patch
  patch -Np1 -i "${srcdir}"/chromium-SIOCGSTAMP.patch

  for lib in "${_system_libs[@]}" libjpeg_turbo; do
      find -type f -path "*third_party/${lib}/*" \
          \! -path "*third_party/${lib}/chromium/*" \
          \! -path "*third_party/${lib}/google/*" \
          \! -path "*base/third_party/icu/*" \
          \! -path "*base/third_party/libevent/*" \
          \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
          -delete
  done
  python2 build/linux/unbundle/replace_gn_files.py --system-libraries "${_system_libs[@]}"

  # Create sysmlink to system Node.js
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin
}

build() {
  export PATH="${srcdir}/python2-path:${PATH}"

  # Build GN
  cd "${srcdir}/electron/vendor/libchromiumcontent/src"
  gn_flags=(
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'treat_warnings_as_errors=false'
    'use_custom_libcxx=false'
    'use_sysroot=false'
    'use_gconf=false'
    'use_gnome_keyring=false'
)
  CC=clang CXX=clang++ python2 tools/gn/bootstrap/bootstrap.py --gn-gen-args "${gn_flags[*]}"
  # libevent not needed anymore
  find -type f -path "*base/third_party/libevent/*" \
    \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
    -delete

  cd "${srcdir}/electron/vendor/libchromiumcontent"
  script/update -t x64 --skip_gclient
  script/build -t x64 -c static_library native_mksnapshot
  script/create-dist -c static_library -t x64 --no_zip -t x64

  cd "${srcdir}"/electron
  LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
  distdir="${srcdir}/electron/vendor/libchromiumcontent/dist/main"
  script/bootstrap.py --verbose \
                      --clang_dir=/usr \
                      --libcc_source_path="${distdir}/src" \
                      --libcc_shared_library_path="${distdir}/shared_library" \
                      --libcc_static_library_path="${distdir}/static_library"
  script/build.py -c Release --ninja-path=ninja
}

package() {
  cd "${srcdir}"/electron

  _cc="${srcdir}"/electron/vendor/libchromiumcontent/dist/main

  install -Dm644 LICENSE "${_cc}"/LICENSES.chromium.html \
          -t "${pkgdir}"/usr/share/licenses/electron2
  for lib in native_mate node; do
    install -m644 vendor/${lib}/LICENSE \
            "${pkgdir}"/usr/share/licenses/electron2/LICENSE-${lib}
  done
  install -m644 vendor/libchromiumcontent/src/LICENSE \
          "${pkgdir}"/usr/share/licenses/electron2/LICENSE-chromium

  cd out/R
  install -Dm644 blink_image_resources_200_percent.pak \
          content_resources_200_percent.pak content_shell.pak icudtl.dat \
          natives_blob.bin \
          pdf_viewer_resources.pak \
          snapshot_blob.bin \
          ui_resources_200_percent.pak \
          views_resources_200_percent.pak \
          -t "${pkgdir}"/usr/lib/electron2
  install -m755 electron "${pkgdir}"/usr/lib/electron2/electron
  install -dm755 "${pkgdir}"/usr/bin
  ln -s ../lib/electron2/electron "${pkgdir}"/usr/bin/electron2
  # namcap warning: Referenced library 'libnode.so' is an uninstalled dependency
  # Fixable by moving libnode.so to /usr/lib
  install -m644 libnode.so "${pkgdir}"/usr/lib/electron2
  cp -r locales resources "${pkgdir}"/usr/lib/electron2
  cd ../..

  echo -n "v${pkgver}" > "${pkgdir}"/usr/lib/electron2/version

  # Install .desktop and icon file
  install -Dm644 "${srcdir}"/electron2.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm644 default_app/icon.png \
          "${pkgdir}"/usr/share/pixmaps/electron2.png  # hicolor has no 1024x1024

  # Install Node headers
  _headers_dest="${pkgdir}/usr/lib/electron2/node"
  install -d -m755 "${_headers_dest}"
  cd "${srcdir}"/electron/vendor/node
  find src deps/http_parser deps/zlib deps/uv deps/npm \
    -name "*.gypi" \
      -exec install -D -m644 '{}' "${_headers_dest}/{}" \; \
    -or -name "*.h" \
      -exec install -D -m644 '{}' "${_headers_dest}/{}" \;
  install -m644 {common,config}.gypi "${_headers_dest}"
  cd "${_cc}"/src
  find v8 -name "*.h" \
    -exec install -D -m644 '{}' "${_headers_dest}/deps/{}" \;
  # echo '9' > "${_headers_dest}/installVersion"
}
