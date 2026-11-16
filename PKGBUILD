# Maintainer: Lazerbeak12345 <contact me on github or mastodon>
# Contributor: Ariel Abreu <facekapow@outlook.com>
# Contributor: James Brink <brink.james@gmail.com>
# Contributor: X0rg

VCSCLIENTS+=('git-lfs::git-lfs')
_gitname=noaidarling
pkgbase=$_gitname-git
pkgname=(
    'noaidarling-git' 'noaidarling-extra-git' 'noaidarling-core-git' 'noaidarling-system-git' 'noaidarling-cli-git' 'noaidarling-ffi-git' 'noaidarling-cli-devenv-git'
    'noaidarling-cli-gui-common-git' 'noaidarling-iokitd-git' 'noaidarling-cli-devenv-gui-common-git' 'noaidarling-cli-extra-git' 'noaidarling-gui-git'
    'noaidarling-python2-git' 'noaidarling-cli-python2-common-git' 'noaidarling-pyobjc-git' 'noaidarling-ruby-git' 'noaidarling-perl-git'
    'noaidarling-jsc-webkit-common-git' 'noaidarling-jsc-git' 'noaidarling-iosurface-git' 'noaidarling-cli-devenv-gui-stubs-common-git'
    'noaidarling-gui-stubs-git'
)
pkgver=r4405.ff77380e7
pkgrel=1
arch=('x86_64')
url="https://github.com/NoAiDarling/NoAiDarling"
license=('GPL3')
makedepends=(
    # `depends` for noaidarling-core
    'xdg-user-dirs'

    # `depends` for noaidarling-cli
    'fuse'

    # depends for noaidarling-gui
    'libfreetype.so' 'libjpeg.so' 'libpng' 'libtiff.so' 'libgif.so' 'libEGL.so' 'libfontconfig.so' 'libx11' 'libxext' 'libxrandr'
    'libxcursor' 'libxkbfile' 'libcairo.so' 'libdbus-1.so' 'libGL.so' 'glu'

    'libswresample.so' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libpulse.so'

    # optdepends for noaidarling-gui
    'libvulkan.so' 'llvm-libs'

    # actual makedepends
    'cmake' 'clang' 'flex' 'bison' 'icu' 'pkg-config' 'llvm' 'libbsd' 'git' 'git-lfs' 'python' 'libxml2' 'vulkan-headers'
    'makepkg-git-lfs-proto'
)
makedepends_x86_64=('gcc-multilib' 'lib32-gcc-libs')

# NoAiDarling git repo and all submodules.
source=('darling-libressl-2.2.9'::'git+https://github.com/NoAiDarling/darling-libressl.git#branch=v2.2.9'
        'darling-libressl-2.5.5'::'git+https://github.com/NoAiDarling/darling-libressl.git#branch=v2.5.5'
        'darling-libressl-2.6.5'::'git+https://github.com/NoAiDarling/darling-libressl.git#branch=v2.6.5'
        'darling-libressl-2.8.3'::'git+https://github.com/NoAiDarling/darling-libressl.git#branch=v2.8.3'
        'git+https://github.com/NoAiDarling/cctools-port.git'
        'git+https://github.com/NoAiDarling/darling-adv_cmds.git'
        'git+https://github.com/NoAiDarling/darling-apr.git'
        'git+https://github.com/NoAiDarling/darling-architecture'
        'git+https://github.com/NoAiDarling/darling-AvailabilityVersions'
        'git+https://github.com/NoAiDarling/darling-awk.git'
        'git+https://github.com/NoAiDarling/darling-bash.git'
        'git+https://github.com/NoAiDarling/darling-basic_cmds.git'
        'git+https://github.com/NoAiDarling/darling-bc.git'
        'git+https://github.com/NoAiDarling/darling-BerkeleyDB.git'
        'git+https://github.com/NoAiDarling/darling-bind9.git'
        'git+https://github.com/NoAiDarling/darling-bmalloc.git'
        'git+https://github.com/NoAiDarling/darling-bootstrap_cmds.git'
        'git+https://github.com/NoAiDarling/darling-bsm.git'
        'git+https://github.com/NoAiDarling/darling-bzip2.git'
        'git+https://github.com/NoAiDarling/darling-cctools.git'
        'git+https://github.com/NoAiDarling/darling-cfnetwork.git'
        'git+https://github.com/NoAiDarling/darling-cocotron.git'
        'git+https://github.com/NoAiDarling/darling-commoncrypto.git'
        'git+https://github.com/NoAiDarling/darling-compiler-rt.git'
        'git+https://github.com/NoAiDarling/darling-configd.git'
        'git+https://github.com/NoAiDarling/darling-copyfile.git'
        'git+https://github.com/NoAiDarling/darling-corecrypto.git'
        'git+https://github.com/NoAiDarling/darling-corefoundation.git'
        'git+https://github.com/NoAiDarling/darling-coretls.git'
        'git+https://github.com/NoAiDarling/darling-crontabs.git'
        'git+https://github.com/NoAiDarling/darling-csu.git'
        'git+https://github.com/NoAiDarling/darling-cups.git'
        'git+https://github.com/NoAiDarling/darling-curl.git'
        'git+https://github.com/NoAiDarling/darling-dbuskit.git'
        'git+https://github.com/NoAiDarling/darling-DirectoryService.git'
        'git+https://github.com/NoAiDarling/darling-dmg.git'
        'git+https://github.com/NoAiDarling/darling-doc_cmds.git'
        'git+https://github.com/NoAiDarling/darling-DSTools.git'
        'git+https://github.com/NoAiDarling/darling-dtrace.git'
        'git+https://github.com/NoAiDarling/darling-dyld.git'
        'git+https://github.com/NoAiDarling/darling-energytrace.git'
        'git+https://github.com/NoAiDarling/darling-expat.git'
        'git+https://github.com/NoAiDarling/darling-file_cmds.git'
        'git+https://github.com/NoAiDarling/darling-file.git'
        'git+https://github.com/NoAiDarling/darling-files.git'
        'git+https://github.com/NoAiDarling/darling-foundation.git'
        'git+https://github.com/NoAiDarling/darling-gnudiff.git'
        'git+https://github.com/NoAiDarling/darling-gnutar.git'
        'git+https://github.com/NoAiDarling/darling-gpatch.git'
        'git+https://github.com/NoAiDarling/darling-grep.git'
        'git+https://github.com/NoAiDarling/darling-groff.git'
        'git+https://github.com/NoAiDarling/darling-Heimdal.git'
        'git+https://github.com/NoAiDarling/darling-icu.git'
        'git+https://github.com/NoAiDarling/darling-installer.git'
        'git+https://github.com/NoAiDarling/darling-IOGraphics.git'
        'git+https://github.com/NoAiDarling/darling-IOHIDFamily.git'
        'git+https://github.com/NoAiDarling/darling-iokitd.git'
        'git+https://github.com/NoAiDarling/darling-IOKitTools.git'
        'git+https://github.com/NoAiDarling/darling-iokituser.git'
        'git+https://github.com/NoAiDarling/darling-IONetworkingFamily.git'
        'git+https://github.com/NoAiDarling/darling-iostoragefamily.git'
        'git+https://github.com/NoAiDarling/darling-JavaScriptCore.git'
        'git+https://github.com/NoAiDarling/darling-keymgr.git'
        'git+https://github.com/NoAiDarling/darling-less.git'
        'git+https://github.com/NoAiDarling/darling-libarchive.git'
        'git+https://github.com/NoAiDarling/darling-libauto.git'
        'git+https://github.com/NoAiDarling/darling-Libc.git'
        'git+https://github.com/NoAiDarling/darling-libclosure.git'
        'git+https://github.com/NoAiDarling/darling-libcxx.git'
        'git+https://github.com/NoAiDarling/darling-libcxxabi.git'
        'git+https://github.com/NoAiDarling/darling-libdispatch.git'
        'git+https://github.com/NoAiDarling/darling-libedit.git'
        'git+https://github.com/NoAiDarling/darling-libffi.git'
        'git+https://github.com/NoAiDarling/darling-libiconv.git'
        'git+https://github.com/NoAiDarling/darling-Libinfo.git'
        'git+https://github.com/NoAiDarling/darling-libkqueue.git'
        'git+https://github.com/NoAiDarling/darling-liblzma.git'
        'git+https://github.com/NoAiDarling/darling-libmalloc.git'
        'git+https://github.com/NoAiDarling/darling-libnetwork.git'
        'git+https://github.com/NoAiDarling/darling-Libnotify.git'
        'git+https://github.com/NoAiDarling/darling-libplatform.git'
        'git+https://github.com/NoAiDarling/darling-libpthread.git'
        'git+https://github.com/NoAiDarling/darling-libresolv.git'
        'git+https://github.com/NoAiDarling/darling-librpcsvc.git'
        'git+https://github.com/NoAiDarling/darling-libstdcxx.git'
        'git+https://github.com/NoAiDarling/darling-Libsystem.git'
        'git+https://github.com/NoAiDarling/darling-libtelnet.git'
        'git+https://github.com/NoAiDarling/darling-libtrace.git'
        'git+https://github.com/NoAiDarling/darling-libunwind.git'
        'git+https://github.com/NoAiDarling/darling-libutil.git'
        'git+https://github.com/NoAiDarling/darling-libxml2.git'
        'git+https://github.com/NoAiDarling/darling-libxpc.git'
        'git+https://github.com/NoAiDarling/darling-libxslt.git'
        'git+https://github.com/NoAiDarling/darling-mail_cmds.git'
        'git+https://github.com/NoAiDarling/darling-man.git'
        'git+https://github.com/NoAiDarling/darling-mDNSResponder.git'
        'git+https://github.com/NoAiDarling/darling-metal.git'
        'git+https://github.com/NoAiDarling/darling-misc_cmds.git'
        'git+https://github.com/NoAiDarling/darling-MITKerberosShim.git'
        'git+https://github.com/NoAiDarling/darling-nano.git'
        'git+https://github.com/NoAiDarling/darling-ncurses.git'
        'git+https://github.com/NoAiDarling/darling-netcat.git'
        'git+https://github.com/NoAiDarling/darling-network_cmds.git'
        'git+https://github.com/NoAiDarling/darling-nghttp2.git'
        'git+https://github.com/NoAiDarling/darling-objc4.git'
        'git+https://github.com/NoAiDarling/darling-openal.git'
        'git+https://github.com/NoAiDarling/darling-opendirectory.git'
        'git+https://github.com/NoAiDarling/darling-openjdk.git'
        'git+https://github.com/NoAiDarling/darling-OpenLDAP.git'
        'git+https://github.com/NoAiDarling/darling-openpam.git'
        'git+https://github.com/NoAiDarling/darling-openssh.git'
        'git+https://github.com/NoAiDarling/darling-openssl_certificates.git'
        'git+https://github.com/NoAiDarling/darling-openssl.git'
        'git+https://github.com/NoAiDarling/darling-pam_modules.git'
        'git+https://github.com/NoAiDarling/darling-passwordserver_sasl.git'
        'git+https://github.com/NoAiDarling/darling-patch_cmds.git'
        'git+https://github.com/NoAiDarling/darling-pcre.git'
        'git+https://github.com/NoAiDarling/darling-perl.git'
        'git+https://github.com/NoAiDarling/darling-pyobjc.git'
        'git+https://github.com/NoAiDarling/darling-python_modules.git'
        'git+https://github.com/NoAiDarling/darling-python.git'
        'git+https://github.com/NoAiDarling/darling-remote_cmds.git'
        'git+https://github.com/NoAiDarling/darling-removefile.git'
        'git+https://github.com/NoAiDarling/darling-rsync.git'
        'git+https://github.com/NoAiDarling/darling-ruby.git'
        'git+https://github.com/NoAiDarling/darling-screen.git'
        'git+https://github.com/NoAiDarling/darling-security.git'
        'git+https://github.com/NoAiDarling/darling-SecurityTokend.git'
        'git+https://github.com/NoAiDarling/darling-shell_cmds.git'
        'git+https://github.com/NoAiDarling/darling-SmartCardServices.git'
        'git+https://github.com/NoAiDarling/darling-sqlite.git'
        # git-lfs forces us to specify the branch.
        'git-lfs+https://github.com/NoAiDarling/darling-swift.git#branch=master'
        'git+https://github.com/NoAiDarling/darling-swift-corelibs-foundation.git'
        'git+https://github.com/NoAiDarling/darling-syslog.git'
        'git+https://github.com/NoAiDarling/darling-system_cmds.git'
        'git+https://github.com/NoAiDarling/darling-tcsh.git'
        'git+https://github.com/NoAiDarling/darling-text_cmds.git'
        'git+https://github.com/NoAiDarling/darling-TextEdit.git'
        'git+https://github.com/NoAiDarling/darling-top.git'
        'git+https://github.com/NoAiDarling/darling-usertemplate.git'
        'git+https://github.com/NoAiDarling/darling-vim.git'
        'git+https://github.com/NoAiDarling/darling-WebCore.git'
        'git+https://github.com/NoAiDarling/darling-WTF.git'
        'git+https://github.com/NoAiDarling/darling-xar.git'
        'git+https://github.com/NoAiDarling/darling-xnu.git'
        'git+https://github.com/NoAiDarling/darling-zip.git'
        'git+https://github.com/NoAiDarling/darling-zlib.git'
        'git+https://github.com/NoAiDarling/darling-zsh.git'
        'git+https://github.com/NoAiDarling/noaidarling.git'
        'git+https://github.com/NoAiDarling/darlingserver.git'
        'git+https://github.com/NoAiDarling/fmdb.git'
        'git+https://github.com/NoAiDarling/indium.git'
        'git+https://github.com/NoAiDarling/lzfse.git'
        'git+https://github.com/NoAiDarling/xcbuild.git')

# We skip md5 on all git repos
md5sums=( 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
          'SKIP' 'SKIP' 'SKIP' 'SKIP')
options=('!buildflags')

# Use this to select the build tool. ninja may require cleanbuilds more often than make will (due to a bug in cmake), but is much faster.
if [[ "$DARLING_USE_NINJA_BUILD" == "1" ]]; then
    _GTool="Ninja"
    _buildCli="ninja"
else
    # Default:
    _GTool="Unix Makefiles"
    _buildCli="make"
fi

pkgver() {
    cd "$srcdir/$_gitname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_gitname"

    echo "Initialize git submodules."
    git submodule init

    echo "Updating git submodule paths."
    git config submodule.src/external/adv_cmds.url "$srcdir/darling-adv_cmds"
    git config submodule.src/external/apr.url "$srcdir/darling-apr"
    git config submodule.src/external/architecture.url "$srcdir/darling-architecture"
    git config submodule.src/external/AvailabilityVersions.url "$srcdir/darling-AvailabilityVersions"
    git config submodule.src/external/awk.url "$srcdir/darling-awk"
    git config submodule.src/external/bash.url "$srcdir/darling-bash"
    git config submodule.src/external/basic_cmds.url "$srcdir/darling-basic_cmds"
    git config submodule.src/external/bc.url "$srcdir/darling-bc"
    git config submodule.src/external/BerkeleyDB.url "$srcdir/darling-BerkeleyDB"
    git config submodule.src/external/bind9.url "$srcdir/darling-bind9"
    git config submodule.src/external/bmalloc.url "$srcdir/darling-bmalloc"
    git config submodule.src/external/bootstrap_cmds.url "$srcdir/darling-bootstrap_cmds"
    git config submodule.src/external/bsm.url "$srcdir/darling-bsm"
    git config submodule.src/external/bzip2.url "$srcdir/darling-bzip2"
    git config submodule.src/external/cctools-port.url "$srcdir/cctools-port"
    git config submodule.src/external/cctools.url "$srcdir/darling-cctools"
    git config submodule.src/external/cfnetwork.url "$srcdir/darling-cfnetwork"
    git config submodule.src/external/cocotron.url "$srcdir/darling-cocotron"
    git config submodule.src/external/commoncrypto.url "$srcdir/darling-commoncrypto"
    git config submodule.src/external/compiler-rt.url "$srcdir/darling-compiler-rt"
    git config submodule.src/external/configd.url "$srcdir/darling-configd"
    git config submodule.src/external/copyfile.url "$srcdir/darling-copyfile"
    git config submodule.src/external/corecrypto.url "$srcdir/darling-corecrypto"
    git config submodule.src/external/corefoundation.url "$srcdir/darling-corefoundation"
    git config submodule.src/external/coretls.url "$srcdir/darling-coretls"
    git config submodule.src/external/crontabs.url "$srcdir/darling-crontabs"
    git config submodule.src/external/csu.url "$srcdir/darling-csu"
    git config submodule.src/external/cups.url "$srcdir/darling-cups"
    git config submodule.src/external/curl.url "$srcdir/darling-curl"
    git config submodule.src/external/darling-dmg.url "$srcdir/darling-dmg"
    git config submodule.src/external/darlingserver.url "$srcdir/darlingserver"
    git config submodule.src/external/dbuskit.url "$srcdir/darling-dbuskit"
    git config submodule.src/external/DirectoryService.url "$srcdir/darling-DirectoryService"
    git config submodule.src/external/doc_cmds.url "$srcdir/darling-doc_cmds"
    git config submodule.src/external/DSTools.url "$srcdir/darling-DSTools"
    git config submodule.src/external/dtrace.url "$srcdir/darling-dtrace"
    git config submodule.src/external/dyld.url "$srcdir/darling-dyld"
    git config submodule.src/external/energytrace.url "$srcdir/darling-energytrace"
    git config submodule.src/external/expat.url "$srcdir/darling-expat"
    git config submodule.src/external/file_cmds.url "$srcdir/darling-file_cmds"
    git config submodule.src/external/file.url "$srcdir/darling-file"
    git config submodule.src/external/files.url "$srcdir/darling-files"
    git config submodule.src/external/fmdb.url "$srcdir/fmdb"
    git config submodule.src/external/foundation.url "$srcdir/darling-foundation"
    git config submodule.src/external/gnudiff.url "$srcdir/darling-gnudiff"
    git config submodule.src/external/gnutar.url "$srcdir/darling-gnutar"
    git config submodule.src/external/gpatch.url "$srcdir/darling-gpatch"
    git config submodule.src/external/grep.url "$srcdir/darling-grep"
    git config submodule.src/external/groff.url "$srcdir/darling-groff"
    git config submodule.src/external/Heimdal.url "$srcdir/darling-Heimdal"
    git config submodule.src/external/icu.url "$srcdir/darling-icu"
    git config submodule.src/external/installer.url "$srcdir/darling-installer"
    git config submodule.src/external/iokitd.url "$srcdir/darling-iokitd"
    git config submodule.src/external/IOKitTools.url "$srcdir/darling-IOKitTools"
    git config submodule.src/external/IOKitUser.url "$srcdir/darling-iokituser"
    git config submodule.src/external/IONetworkingFamily.url "$srcdir/darling-IONetworkingFamily"
    git config submodule.src/external/IOStorageFamily.url "$srcdir/darling-iostoragefamily"
    git config submodule.src/external/JavaScriptCore.url "$srcdir/darling-JavaScriptCore"
    git config submodule.src/external/keymgr.url "$srcdir/darling-keymgr"
    git config submodule.src/external/less.url "$srcdir/darling-less"
    git config submodule.src/external/libarchive.url "$srcdir/darling-libarchive"
    git config submodule.src/external/libauto.url "$srcdir/darling-libauto"
    git config submodule.src/external/libc.url "$srcdir/darling-Libc"
    git config submodule.src/external/libclosure.url "$srcdir/darling-libclosure"
    git config submodule.src/external/libcxx.url "$srcdir/darling-libcxx"
    git config submodule.src/external/libcxxabi.url "$srcdir/darling-libcxxabi"
    git config submodule.src/external/libdispatch.url "$srcdir/darling-libdispatch"
    git config submodule.src/external/libedit.url "$srcdir/darling-libedit"
    git config submodule.src/external/libffi.url "$srcdir/darling-libffi"
    git config submodule.src/external/libiconv.url "$srcdir/darling-libiconv"
    git config submodule.src/external/Libinfo.url "$srcdir/darling-Libinfo"
    git config submodule.src/external/libkqueue.url "$srcdir/darling-libkqueue"
    git config submodule.src/external/liblzma.url "$srcdir/darling-liblzma"
    git config submodule.src/external/libmalloc.url "$srcdir/darling-libmalloc"
    git config submodule.src/external/libnetwork.url "$srcdir/darling-libnetwork"
    git config submodule.src/external/libnotify.url "$srcdir/darling-Libnotify"
    git config submodule.src/external/libplatform.url "$srcdir/darling-libplatform"
    git config submodule.src/external/libpthread.url "$srcdir/darling-libpthread"
    git config submodule.src/external/libresolv.url "$srcdir/darling-libresolv"
    git config submodule.src/external/libressl-2.2.9.url "$srcdir/darling-libressl-2.2.9"
    git config submodule.src/external/libressl-2.5.5.url "$srcdir/darling-libressl-2.5.5"
    git config submodule.src/external/libressl-2.6.5.url "$srcdir/darling-libressl-2.6.5"
    git config submodule.src/external/libressl-2.8.3.url "$srcdir/darling-libressl-2.8.3"
    git config submodule.src/external/librpcsvc.url "$srcdir/darling-librpcsvc"
    git config submodule.src/external/libstdcxx.url "$srcdir/darling-libstdcxx"
    git config submodule.src/external/libsystem.url "$srcdir/darling-Libsystem"
    git config submodule.src/external/libtelnet.url "$srcdir/darling-libtelnet"
    git config submodule.src/external/libtrace.url "$srcdir/darling-libtrace"
    git config submodule.src/external/libunwind.url "$srcdir/darling-libunwind"
    git config submodule.src/external/libutil.url "$srcdir/darling-libutil"
    git config submodule.src/external/libxml2.url "$srcdir/darling-libxml2"
    git config submodule.src/external/libxpc.url "$srcdir/darling-libxpc"
    git config submodule.src/external/libxslt.url "$srcdir/darling-libxslt"
    git config submodule.src/external/lzfse.url "$srcdir/lzfse"
    git config submodule.src/external/mail_cmds.url "$srcdir/darling-mail_cmds"
    git config submodule.src/external/man.url "$srcdir/darling-man"
    git config submodule.src/external/mDNSResponder.url "$srcdir/darling-mDNSResponder"
    git config submodule.src/external/metal.url "$srcdir/darling-metal"
    git config submodule.src/external/misc_cmds.url "$srcdir/darling-misc_cmds"
    git config submodule.src/external/MITKerberosShim.url "$srcdir/darling-MITKerberosShim"
    git config submodule.src/external/nano.url "$srcdir/darling-nano"
    git config submodule.src/external/ncurses.url "$srcdir/darling-ncurses"
    git config submodule.src/external/netcat.url "$srcdir/darling-netcat"
    git config submodule.src/external/network_cmds.url "$srcdir/darling-network_cmds"
    git config submodule.src/external/nghttp2.url "$srcdir/darling-nghttp2"
    git config submodule.src/external/objc4.url "$srcdir/darling-objc4"
    git config submodule.src/external/OpenAL.url "$srcdir/darling-openal"
    git config submodule.src/external/OpenDirectory.url "$srcdir/darling-opendirectory"
    git config submodule.src/external/openjdk.url "$srcdir/darling-openjdk"
    git config submodule.src/external/OpenLDAP.url "$srcdir/darling-OpenLDAP"
    git config submodule.src/external/openpam.url "$srcdir/darling-openpam"
    git config submodule.src/external/openssh.url "$srcdir/darling-openssh"
    git config submodule.src/external/openssl_certificates.url "$srcdir/darling-openssl_certificates"
    git config submodule.src/external/openssl.url "$srcdir/darling-openssl"
    git config submodule.src/external/passwordserver_sasl.url "$srcdir/darling-passwordserver_sasl"
    git config submodule.src/external/patch_cmds.url "$srcdir/darling-patch_cmds"
    git config submodule.src/external/pcre.url "$srcdir/darling-pcre"
    git config submodule.src/external/perl.url "$srcdir/darling-perl"
    git config submodule.src/external/pyobjc.url "$srcdir/darling-pyobjc"
    git config submodule.src/external/python_modules.url "$srcdir/darling-python_modules"
    git config submodule.src/external/python.url "$srcdir/darling-python"
    git config submodule.src/external/remote_cmds.url "$srcdir/darling-remote_cmds"
    git config submodule.src/external/removefile.url "$srcdir/darling-removefile"
    git config submodule.src/external/rsync.url "$srcdir/darling-rsync"
    git config submodule.src/external/ruby.url "$srcdir/darling-ruby"
    git config submodule.src/external/screen.url "$srcdir/darling-screen"
    git config submodule.src/external/security.url "$srcdir/darling-security"
    git config submodule.src/external/SecurityTokend.url "$srcdir/darling-SecurityTokend"
    git config submodule.src/external/shell_cmds.url "$srcdir/darling-shell_cmds"
    git config submodule.src/external/SmartCardServices.url "$srcdir/darling-SmartCardServices"
    git config submodule.src/external/sqlite.url "$srcdir/darling-sqlite"
    git config submodule.src/external/swift.url "$srcdir/darling-swift"
    git config submodule.src/external/syslog.url "$srcdir/darling-syslog"
    git config submodule.src/external/system_cmds.url "$srcdir/darling-system_cmds"
    git config submodule.src/external/tcsh.url "$srcdir/darling-tcsh"
    git config submodule.src/external/text_cmds.url "$srcdir/darling-text_cmds"
    git config submodule.src/external/TextEdit.url "$srcdir/darling-TextEdit"
    git config submodule.src/external/top.url "$srcdir/darling-top"
    git config submodule.src/external/usertemplate.url "$srcdir/darling-usertemplate"
    git config submodule.src/external/vim.url "$srcdir/darling-vim"
    git config submodule.src/external/WebCore.url "$srcdir/darling-WebCore"
    git config submodule.src/external/WTF.url "$srcdir/darling-WTF"
    git config submodule.src/external/xar.url "$srcdir/darling-xar"
    git config submodule.src/external/xcbuild.url "$srcdir/xcbuild"
    git config submodule.src/external/xnu.url "$srcdir/darling-xnu"
    git config submodule.src/external/zip.url "$srcdir/darling-zip"
    git config submodule.src/external/zlib.url "$srcdir/darling-zlib"
    git config submodule.src/external/zsh.url "$srcdir/darling-zsh"

    echo "Updating git submodules"
    git -c protocol.file.allow=always submodule update

    echo "Updating recursive submodules"

    cd "$srcdir/$_gitname/src/external/openpam/"
    git submodule init
    git config submodule.pam_modules.url "$srcdir/darling-pam_modules"
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_gitname/src/external/IOKitUser"
    git submodule init
    git config submodule.IOGraphics.url "$srcdir/darling-IOGraphics"
    git config submodule.IOHIDFamily.url "$srcdir/darling-IOHIDFamily"
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_gitname/src/external/metal"
    git submodule init
    git config submodule.deps/indium.url "$srcdir/indium"
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_gitname/src/external/corefoundation"
    git submodule init
    git config submodule.submodules/swift-corelibs-foundation.url "$srcdir/darling-swift-corelibs-foundation"
    git -c protocol.file.allow=always submodule update

    echo "Updating LFS files"
    cd "$srcdir/$_gitname/src/external/swift"
    git lfs install --worktree
    git lfs pull

    echo "Creating build directory."
    cd "$srcdir/$_gitname"
    mkdir -pv "build"
}

build() {
    cd "$srcdir/$_gitname/build"

    echo "Running cmake."
    CFLAGS="" CXXFLAGS="" CPPFLAGS="" LDFLAGS="" cmake .. -G "$_GTool" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DDEBIAN_PACKAGING=ON -DJSC_UNIFIED_BUILD=ON -DENABLE_METAL=ON

    echo "Running $_buildCli."
    $_buildCli
}

package_noaidarling-git() {
    pkgdesc='Translation layer for running macOS software on Linux. Clean room: without AI contamination'
    depends=('noaidarling-cli-git' 'noaidarling-python2-git' 'noaidarling-ruby-git' 'noaidarling-perl-git' 'noaidarling-gui-git' 'noaidarling-gui-stubs-git' 'noaidarling-pyobjc-git')
    provides=(
            'noaidarling' 'noaidarling-cli-devenv'
            'darling' 'darling-cli-devenv'
    )
    conflicts=(
            'darling'
            'darling-git'
    )

    true
}

package_noaidarling-extra-git() {
    pkgdesc='Extra components for NoAiDarling that are not part of a typical ("stock") installation'
    depends=('noaidarling-git' 'noaidarling-jsc-git' 'noaidarling-cli-extra-git')
    provides=(
            'noaidarling-extra'
            'darling-extra'
    )
    conflicts=(
            'darling-extra'
            'darling-extra-git'
    )

    true
}

package_noaidarling-core-git() {
    pkgdesc='Core components of NoAiDarling'
    depends=('glibc' 'gcc-libs' 'xdg-user-dirs')
    depends_x86_64=('lib32-glibc' 'lib32-gcc-libs')
    provides=(
            'noaidarling-core'
            'darling-core'
    )
    conflicts=(
            'darling-core'
            'darling-core-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=core -P cmake_install.cmake
}

package_noaidarling-system-git() {
    pkgdesc='System components of NoAiDarling'
    depends=('noaidarling-core-git')
    provides=(
            'noaidarling-system'
            'darling-system'
    )
    conflicts=(
            'darling-system'
            'darling-system-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=system -P cmake_install.cmake
}

package_noaidarling-cli-git() {
    pkgdesc='CLI components of NoAiDarling'
    depends=(
        'noaidarling-system-git' 'noaidarling-cli-gui-common-git' 'noaidarling-cli-python2-common-git'

        'fuse'
    )
    provides=(
            'noaidarling-cli'
            'darling-cli'
    )
    conflicts=(
            'darling-cli'
            'darling-cli-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=cli -P cmake_install.cmake
}

package_noaidarling-ffi-git() {
    pkgdesc='libffi built for use within NoAiDarling'
    depends=('noaidarling-core-git')
    provides=(
            'noaidarling-ffi'
            'darling-ffi'
    )
    conflicts=(
            'darling-ffi'
            'darling-ffi-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=ffi -P cmake_install.cmake
}

package_noaidarling-cli-devenv-git() {
    pkgdesc='A NoAiDarling environment for CLI-only programs for building and developing using the command line developer tools'
    depends=(
        'noaidarling-cli-git' 'noaidarling-python2-git' 'noaidarling-ruby-git' 'noaidarling-perl-git' 'noaidarling-cli-devenv-gui-common-git'
        'noaidarling-cli-devenv-gui-stubs-common-git' 'noaidarling-iosurface-git'
    )
    provides=(
            'noaidarling-cli-devenv'
            'darling-cli-devenv'
    )
    conflicts=(
            'darling-cli-devenv' 'darling-gui' 'darling-gui-stubs'
            'darling-cli-devenv-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=cli_dev -P cmake_install.cmake
}

package_noaidarling-cli-gui-common-git() {
    pkgdesc='Components of NoAiDarling that are shared between the CLI and GUI components'
    depends=('noaidarling-system-git')
    provides=(
            'noaidarling-cli-gui-common'
            'darling-cli-gui-common'
    )
    conflicts=(
            'darling-cli-gui-common'
            'darling-cli-gui-common-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=cli_gui_common -P cmake_install.cmake
}

package_noaidarling-iokitd-git() {
    pkgdesc='IOKit daemon for NoAiDarling'
    depends=('noaidarling-system-git' 'noaidarling-iosurface-git')
    provides=(
            'noaidarling-iokitd'
            'darling-iokitd'
    )
    conflicts=(
            'darling-iokitd'
            'darling-iokitd-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=iokitd -P cmake_install.cmake
}

package_noaidarling-cli-devenv-gui-common-git() {
    pkgdesc='Components of NoAiDarling that are shared between the developer environment and the GUI components'
    depends=('noaidarling-system-git')
    provides=(
            'noaidarling-cli-devenv-gui-common'
            'darling-cli-devenv-gui-common'
    )
    conflicts=(
            'darling-cli-devenv-gui-common'
            'darling-cli-devenv-gui-common-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=cli_dev_gui_common -P cmake_install.cmake
}

package_noaidarling-cli-extra-git() {
    pkgdesc='Non-standard CLI components of NoAiDarling'
    depends=('noaidarling-cli-git')
    provides=(
            'noaidarling-cli-extra'
            'darling-cli-extra'
    )
    conflicts=(
            'darling-cli-extra'
            'darling-cli-extra-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=cli_extra -P cmake_install.cmake
}

package_noaidarling-gui-git() {
    pkgdesc='GUI components of NoAiDarling'
    depends=(
        'noaidarling-system-git' 'noaidarling-cli-devenv-gui-common-git' 'noaidarling-iokitd-git' 'noaidarling-cli-gui-common-git' 'noaidarling-iosurface-git'

        'libfreetype.so' 'libjpeg.so' 'libpng' 'libtiff.so' 'libgif.so' 'libEGL.so' 'libfontconfig.so' 'libx11' 'libxext' 'libxrandr'
        'libxcursor' 'libxkbfile' 'libcairo.so' 'libdbus-1.so' 'libGL.so' 'glu'

        'libswresample.so' 'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libpulse.so'
    )
    optdepends=(
        'libvulkan.so: Metal support'
        'llvm-libs: Metal support'
    )
    provides=(
            'noaidarling-gui'
            'darling-gui'
    )
    conflicts=(
            'darling-gui'
            'darling-gui-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=gui -P cmake_install.cmake
}

package_noaidarling-python2-git() {
    pkgdesc='Python 2 (and associated programs) built for use within NoAiDarling'
    depends=('noaidarling-core-git' 'noaidarling-cli-python2-common-git' 'noaidarling-ffi-git')
    provides=(
            'noaidarling-python2'
            'darling-python2'
    )
    conflicts=(
            'darling-python2'
            'darling-python2-git'
    )
    optdepends=(
        'python2: pre-compilation of Python bytecode'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=python -P cmake_install.cmake
}

package_noaidarling-cli-python2-common-git() {
    pkgdesc='Components of NoAiDarling that are shared between the CLI and Python 2 components'
    depends=('noaidarling-core-git')
    provides=(
            'noaidarling-cli-python2-common'
            'darling-cli-python2-common'
    )
    conflicts=(
            'darling-cli-python2-common'
            'darling-cli-python2-common-git'
    )
    optdepends=(
        'python2: pre-compilation of Python bytecode'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=cli_python_common -P cmake_install.cmake
}

package_noaidarling-pyobjc-git() {
    pkgdesc='PyObjC built for use within NoAiDarling'
    depends=('noaidarling-gui-stubs-git' 'noaidarling-python2-git')
    provides=(
            'noaidarling-pyobjc'
            'darling-pyobjc'
    )
    conflicts=(
            'darling-pyobjc'
            'darling-pyobjc-git'
    )
    optdepends=(
        'python2: pre-compilation of Python bytecode'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=pyobjc -P cmake_install.cmake
}

package_noaidarling-ruby-git() {
    pkgdesc='Ruby built for use within NoAiDarling'
    depends=('noaidarling-core-git' 'noaidarling-ffi-git')
    provides=(
            'noaidarling-ruby'
            'darling-ruby'
    )
    conflicts=(
            'darling-ruby'
            'darling-ruby-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=ruby -P cmake_install.cmake
}

package_noaidarling-perl-git() {
    pkgdesc='Perl built for use within NoAiDarling'
    depends=('noaidarling-core-git')
    provides=(
            'noaidarling-perl'
            'darling-perl'
    )
    conflicts=(
            'darling-perl'
            'darling-perl-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=perl -P cmake_install.cmake
}

package_noaidarling-jsc-webkit-common-git() {
    pkgdesc='Components of NoAiDarling that are shared between JavaScriptCore and WebKit'
    depends=('noaidarling-system-git')
    provides=(
            'noaidarling-jsc-webkit-common'
            'darling-jsc-webkit-common'
    )
    conflicts=(
            'darling-jsc-webkit-common'
            'darling-jsc-webkit-common-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=jsc_webkit_common -P cmake_install.cmake
}

package_noaidarling-jsc-git() {
    pkgdesc='JavaScriptCore built for use within NoAiDarling'
    depends=('noaidarling-system-git' 'noaidarling-jsc-webkit-common-git')
    provides=(
            'noaidarling-jsc'
            'darling-jsc'
    )
    conflicts=(
            'darling-jsc'
            'darling-jsc-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=jsc -P cmake_install.cmake
}

package_noaidarling-iosurface-git() {
    pkgdesc='IOSurface framework built for use within NoAiDarling'
    depends=('noaidarling-system-git')
    provides=(
            'noaidarling-iosurface'
            'darling-iosurface'
    )
    conflicts=(
            'darling-iosurface'
            'darling-iosurface-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=iosurface -P cmake_install.cmake
}

package_noaidarling-cli-devenv-gui-stubs-common-git() {
    pkgdesc='Components of NoAiDarling that are shared between the developer environment and GUI stub components'
    depends=('noaidarling-cli-devenv-gui-common-git')
    provides=(
            'noaidarling-cli-devenv-gui-stubs-common'
            'darling-cli-devenv-gui-stubs-common'
    )
    conflicts=(
            'darling-cli-devenv-gui-stubs-common'
            'darling-cli-devenv-gui-stubs-common-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=cli_dev_gui_stubs_common -P cmake_install.cmake
}

package_noaidarling-gui-stubs-git() {
    pkgdesc='GUI stub components of NoAiDarling'
    depends=('noaidarling-gui-git' 'noaidarling-cli-devenv-gui-stubs-common-git')
    provides=(
            'noaidarling-gui-stubs'
            'darling-gui-stubs'
    )
    conflicts=(
            'darling-gui-stubs'
            'darling-gui-stubs-git'
    )

    cd "$srcdir/$_gitname/build"
    DESTDIR="$pkgdir" cmake -G "$_GTool" -DCOMPONENT=gui_stubs -P cmake_install.cmake
}
