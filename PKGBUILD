# Maintainer: Ariel Abreu <facekapow@outlook.com>
# Contributor: James Brink <brink.james@gmail.com>
# Contributor: X0rg

_gitname=darling
pkgbase=$_gitname-git
pkgname='darling-git'
pkgver=r4005.84a6ae50d
pkgrel=1
pkgdesc="Darwin/macOS emulation layer for Linux"
arch=('x86_64')
url="https://www.darlinghq.org"
license=('GPL3')
groups=('darling-git')
depends=('xz' 'fuse' 'libxml2' 'icu' 'openssl' 'bzip2' 'zlib' 'libsystemd'
    'wget' 'curl' 'sqlite' 'ruby' 'sed' 'libarchive' 'file' 'python' 'gawk' 'libunwind' 'ffmpeg')
_depends_x86_64=('lib32-clang' 'lib32-bzip2' 'lib32-systemd' 'lib32-libxslt' 'libpng' 'cairo' 'libtiff' 'glu' 'libbsd' 'python2')
makedepends=('git' 'cmake' 'clang' 'bison' 'flex' 'binutils>=2.28' 'libpng' 'cairo' 'libtiff' 'glu' 'libbsd' 'python2' 'ffmpeg' 'git-lfs')
_make_depends_x86_64=('gcc-multilib')
conflicts=('darling')
provides=('darling')

# Darling git repo and all submodules.
source=('darling-libressl-2.2.9'::'git+https://github.com/darlinghq/darling-libressl.git#branch=v2.2.9'
        'darling-libressl-2.5.5'::'git+https://github.com/darlinghq/darling-libressl.git#branch=v2.5.5'
        'darling-libressl-2.6.5'::'git+https://github.com/darlinghq/darling-libressl.git#branch=v2.6.5'
        'darling-libressl-2.8.3'::'git+https://github.com/darlinghq/darling-libressl.git#branch=v2.8.3'
        'git+https://github.com/darlinghq/cctools-port.git'
        'git+https://github.com/darlinghq/darling-adv_cmds.git'
        'git+https://github.com/darlinghq/darling-apr.git'
        'git+https://github.com/darlinghq/darling-architecture'
        'git+https://github.com/darlinghq/darling-AvailabilityVersions'
        'git+https://github.com/darlinghq/darling-awk.git'
        'git+https://github.com/darlinghq/darling-bash.git'
        'git+https://github.com/darlinghq/darling-basic_cmds.git'
        'git+https://github.com/darlinghq/darling-bc.git'
        'git+https://github.com/darlinghq/darling-BerkeleyDB.git'
        'git+https://github.com/darlinghq/darling-bind9.git'
        'git+https://github.com/darlinghq/darling-bmalloc.git'
        'git+https://github.com/darlinghq/darling-bootstrap_cmds.git'
        'git+https://github.com/darlinghq/darling-bsm.git'
        'git+https://github.com/darlinghq/darling-bzip2.git'
        'git+https://github.com/darlinghq/darling-cctools.git'
        'git+https://github.com/darlinghq/darling-cfnetwork.git'
        'git+https://github.com/darlinghq/darling-cocotron.git'
        'git+https://github.com/darlinghq/darling-commoncrypto.git'
        'git+https://github.com/darlinghq/darling-compiler-rt.git'
        'git+https://github.com/darlinghq/darling-configd.git'
        'git+https://github.com/darlinghq/darling-copyfile.git'
        'git+https://github.com/darlinghq/darling-corecrypto.git'
        'git+https://github.com/darlinghq/darling-corefoundation.git'
        'git+https://github.com/darlinghq/darling-coretls.git'
        'git+https://github.com/darlinghq/darling-crontabs.git'
        'git+https://github.com/darlinghq/darling-csu.git'
        'git+https://github.com/darlinghq/darling-cups.git'
        'git+https://github.com/darlinghq/darling-curl.git'
        'git+https://github.com/darlinghq/darling-dbuskit.git'
        'git+https://github.com/darlinghq/darling-DirectoryService.git'
        'git+https://github.com/darlinghq/darling-dmg.git'
        'git+https://github.com/darlinghq/darling-doc_cmds.git'
        'git+https://github.com/darlinghq/darling-DSTools.git'
        'git+https://github.com/darlinghq/darling-dtrace.git'
        'git+https://github.com/darlinghq/darling-dyld.git'
        'git+https://github.com/darlinghq/darling-energytrace.git'
        'git+https://github.com/darlinghq/darling-expat.git'
        'git+https://github.com/darlinghq/darling-file_cmds.git'
        'git+https://github.com/darlinghq/darling-file.git'
        'git+https://github.com/darlinghq/darling-files.git'
        'git+https://github.com/darlinghq/darling-foundation.git'
        'git+https://github.com/darlinghq/darling-glut.git'
        'git+https://github.com/darlinghq/darling-gnudiff.git'
        'git+https://github.com/darlinghq/darling-gnutar.git'
        'git+https://github.com/darlinghq/darling-gpatch.git'
        'git+https://github.com/darlinghq/darling-grep.git'
        'git+https://github.com/darlinghq/darling-groff.git'
        'git+https://github.com/darlinghq/darling-Heimdal.git'
        'git+https://github.com/darlinghq/darling-icu.git'
        'git+https://github.com/darlinghq/darling-installer.git'
        'git+https://github.com/darlinghq/darling-IOGraphics.git'
        'git+https://github.com/darlinghq/darling-IOHIDFamily.git'
        'git+https://github.com/darlinghq/darling-iokitd.git'
        'git+https://github.com/darlinghq/darling-IOKitTools.git'
        'git+https://github.com/darlinghq/darling-iokituser.git'
        'git+https://github.com/darlinghq/darling-IONetworkingFamily.git'
        'git+https://github.com/darlinghq/darling-iostoragefamily.git'
        'git+https://github.com/darlinghq/darling-JavaScriptCore.git'
        'git+https://github.com/darlinghq/darling-keymgr.git'
        'git+https://github.com/darlinghq/darling-less.git'
        'git+https://github.com/darlinghq/darling-libarchive.git'
        'git+https://github.com/darlinghq/darling-libauto.git'
        'git+https://github.com/darlinghq/darling-Libc.git'
        'git+https://github.com/darlinghq/darling-libclosure.git'
        'git+https://github.com/darlinghq/darling-libcxx.git'
        'git+https://github.com/darlinghq/darling-libcxxabi.git'
        'git+https://github.com/darlinghq/darling-libdispatch.git'
        'git+https://github.com/darlinghq/darling-libedit.git'
        'git+https://github.com/darlinghq/darling-libffi.git'
        'git+https://github.com/darlinghq/darling-libiconv.git'
        'git+https://github.com/darlinghq/darling-Libinfo.git'
        'git+https://github.com/darlinghq/darling-libkqueue.git'
        'git+https://github.com/darlinghq/darling-liblzma.git'
        'git+https://github.com/darlinghq/darling-libmalloc.git'
        'git+https://github.com/darlinghq/darling-libnetwork.git'
        'git+https://github.com/darlinghq/darling-Libnotify.git'
        'git+https://github.com/darlinghq/darling-libplatform.git'
        'git+https://github.com/darlinghq/darling-libpthread.git'
        'git+https://github.com/darlinghq/darling-libresolv.git'
        'git+https://github.com/darlinghq/darling-librpcsvc.git'
        'git+https://github.com/darlinghq/darling-libstdcxx.git'
        'git+https://github.com/darlinghq/darling-Libsystem.git'
        'git+https://github.com/darlinghq/darling-libtelnet.git'
        'git+https://github.com/darlinghq/darling-libtrace.git'
        'git+https://github.com/darlinghq/darling-libunwind.git'
        'git+https://github.com/darlinghq/darling-libutil.git'
        'git+https://github.com/darlinghq/darling-libxml2.git'
        'git+https://github.com/darlinghq/darling-libxpc.git'
        'git+https://github.com/darlinghq/darling-libxslt.git'
        'git+https://github.com/darlinghq/darling-mail_cmds.git'
        'git+https://github.com/darlinghq/darling-man.git'
        'git+https://github.com/darlinghq/darling-mDNSResponder.git'
        'git+https://github.com/darlinghq/darling-metal.git'
        'git+https://github.com/darlinghq/darling-misc_cmds.git'
        'git+https://github.com/darlinghq/darling-MITKerberosShim.git'
        'git+https://github.com/darlinghq/darling-nano.git'
        'git+https://github.com/darlinghq/darling-ncurses.git'
        'git+https://github.com/darlinghq/darling-netcat.git'
        'git+https://github.com/darlinghq/darling-network_cmds.git'
        'git+https://github.com/darlinghq/darling-newlkm.git'
        'git+https://github.com/darlinghq/darling-nghttp2.git'
        'git+https://github.com/darlinghq/darling-objc4.git'
        'git+https://github.com/darlinghq/darling-openal.git'
        'git+https://github.com/darlinghq/darling-opendirectory.git'
        'git+https://github.com/darlinghq/darling-openjdk.git'
        'git+https://github.com/darlinghq/darling-OpenLDAP.git'
        'git+https://github.com/darlinghq/darling-openpam.git'
        'git+https://github.com/darlinghq/darling-openssh.git'
        'git+https://github.com/darlinghq/darling-openssl_certificates.git'
        'git+https://github.com/darlinghq/darling-openssl.git'
        'git+https://github.com/darlinghq/darling-pam_modules.git'
        'git+https://github.com/darlinghq/darling-passwordserver_sasl.git'
        'git+https://github.com/darlinghq/darling-patch_cmds.git'
        'git+https://github.com/darlinghq/darling-pcre.git'
        'git+https://github.com/darlinghq/darling-perl.git'
        'git+https://github.com/darlinghq/darling-pyobjc.git'
        'git+https://github.com/darlinghq/darling-python_modules.git'
        'git+https://github.com/darlinghq/darling-python.git'
        'git+https://github.com/darlinghq/darling-remote_cmds.git'
        'git+https://github.com/darlinghq/darling-removefile.git'
        'git+https://github.com/darlinghq/darling-rsync.git'
        'git+https://github.com/darlinghq/darling-ruby.git'
        'git+https://github.com/darlinghq/darling-screen.git'
        'git+https://github.com/darlinghq/darling-security.git'
        'git+https://github.com/darlinghq/darling-SecurityTokend.git'
        'git+https://github.com/darlinghq/darling-shell_cmds.git'
        'git+https://github.com/darlinghq/darling-SmartCardServices.git'
        'git+https://github.com/darlinghq/darling-sqlite.git'
        'git+https://github.com/darlinghq/darling-swift.git'
        'git+https://github.com/darlinghq/darling-syslog.git'
        'git+https://github.com/darlinghq/darling-system_cmds.git'
        'git+https://github.com/darlinghq/darling-tcsh.git'
        'git+https://github.com/darlinghq/darling-text_cmds.git'
        'git+https://github.com/darlinghq/darling-TextEdit.git'
        'git+https://github.com/darlinghq/darling-top.git'
        'git+https://github.com/darlinghq/darling-usertemplate.git'
        'git+https://github.com/darlinghq/darling-vim.git'
        'git+https://github.com/darlinghq/darling-WebCore.git'
        'git+https://github.com/darlinghq/darling-WTF.git'
        'git+https://github.com/darlinghq/darling-xar.git'
        'git+https://github.com/darlinghq/darling-zip.git'
        'git+https://github.com/darlinghq/darling-zlib.git'
        'git+https://github.com/darlinghq/darling-zsh.git'
        'git+https://github.com/darlinghq/darling.git'
        'git+https://github.com/darlinghq/darlingserver.git'
        'git+https://github.com/darlinghq/fmdb.git'
        'git+https://github.com/darlinghq/lzfse.git'
        'git+https://github.com/darlinghq/xcbuild.git')

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
          'SKIP' 'SKIP' 'SKIP')
options=('!buildflags')

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
    git config submodule.src/external/glut.url "$srcdir/darling-glut"
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
    git config submodule.src/external/lkm.url "$srcdir/darling-newlkm"
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

    echo "Updating LFS files"
    cd "$srcdir/$_gitname/src/external/swift"
    git lfs pull

    echo "Creating build directory."
    cd "$srcdir/$_gitname"
    mkdir -pv "build"
}

build() {
    cd "$srcdir/$_gitname/build"

    echo "Running cmake."
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr

    echo "Running make."
    make
}

package() {
    cd "$srcdir/$_gitname/build"
    make DESTDIR="$pkgdir" install
}
