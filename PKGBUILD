# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=codelite-bin
pkgver=8.1
pkgrel=1
pkgdesc="Cross platform IDE for the C/C++ programming languages"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('clang' 'desktop-file-utils' 'hicolor-icon-theme' 'webkitgtk2' 'wxgtk' 'curl' 'libssh' 'python2' 'libedit' 'glu')
pkgdesc="Open-source, cross platform IDE for the C/C++ programming languages"

makedepends=('chrpath') #'libarchive' 'tar' 'xz')
optdepends=('graphviz: callgraph visualization')
install=codelite.install
replaces=('codelite' 'codelite-svn')
provides=('codelite')

if [[ $CARCH == i686 ]]; then
#	source=('http://repos.codelite.org/ubuntu/pool/universe/c/codelite/codelite_8.1-1.vivid_i386.deb' 'http://repos.codelite.org/ubuntu/pool/universe/w/wxcrafter/wxcrafter_2.3-1.vivid_i386.deb')
#	md5sums=('5a9a7f7c15db0103df40fbf5cdee6697' '3d3a2ab441a54b796ae9fbb88e1b668e')
	source=('http://repos.codelite.org/rpms/fedora/codelite-8.1-1.fc22.i686.rpm' 'http://repos.codelite.org/wxCrafter-2.3/fedora/32/wxcrafter-2.3-1.i686.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/i686/wxBase3-3.0.2-8.fc22.i686.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/i686/wxGTK3-3.0.2-8.fc22.i686.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/i686/wxGTK3-gl-3.0.2-8.fc22.i686.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/i686/wxGTK3-media-3.0.2-8.fc22.i686.rpm'
					'https://kojipkgs.fedoraproject.org/packages/libjpeg/6b/46.fc12/i686/libjpeg-6b-46.fc12.i686.rpm'
					'https://kojipkgs.fedoraproject.org/packages/libtiff/4.0.3/18.fc22/i686/libtiff-4.0.3-18.fc22.i686.rpm'
					'https://kojipkgs.fedoraproject.org/packages/jbigkit/2.1/3.fc22/i686/jbigkit-libs-2.1-3.fc22.i686.rpm')
	md5sums=('a2f3fd76b37a5b4b66bcbb9f0c17f18d' '6246fb45a59a996daae46fbc861fe5d3'
					 'ef0bdba183f84f3de98a75f06129caf2' '97d25b100a2a4c81774a51218329b692'
					 '82263ba5bf692c2cbed225c2df19d259' 'b2655aaec7c3b8c47bd6dd2c53186293'
					 '7bfbd5ed90a4a3f649db8634dbcfa2fd' '6db3057c87f0b10105ac9ebbdd19e9d3' '17d66a188f94248e269507498eaf865d')
#	source=('http://repos.codelite.org/rpms/suse/codelite-8.1-1.suse13.2.i586.rpm' 'http://repos.codelite.org/wxCrafter-2.3/openSUSE/32/wxcrafter-2.3-1.i586.rpm')
#	md5sums=('8a03e95f276578963ef7eff5bf7d5b0a' '716701c819ea1c181c2fecea0fb8fc8d')
else
#	source=('http://repos.codelite.org/ubuntu/pool/universe/c/codelite/codelite_8.1-1.vivid_amd64.deb' 'http://repos.codelite.org/ubuntu/pool/universe/w/wxcrafter/wxcrafter_2.3-1.vivid_amd64.deb')
#	md5sums=('fa4c2b1b2b2f870dec4506a7e5839fb5' 'f7d43c9362133f707cc5710ed5672caa')
	source=('http://repos.codelite.org/rpms/fedora/codelite-8.1-1.fc22.x86_64.rpm' 'http://repos.codelite.org/wxCrafter-2.3/fedora/64/wxcrafter-2.3-1.x86_64.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/x86_64/wxBase3-3.0.2-8.fc22.x86_64.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/x86_64/wxGTK3-3.0.2-8.fc22.x86_64.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/x86_64/wxGTK3-gl-3.0.2-8.fc22.x86_64.rpm'
					'https://kojipkgs.fedoraproject.org/packages/wxGTK3/3.0.2/8.fc22/x86_64/wxGTK3-media-3.0.2-8.fc22.x86_64.rpm'
					'https://kojipkgs.fedoraproject.org/packages/libjpeg/6b/46.fc12/x86_64/libjpeg-6b-46.fc12.x86_64.rpm'
					'https://kojipkgs.fedoraproject.org/packages/libtiff/4.0.3/18.fc22/x86_64/libtiff-4.0.3-18.fc22.x86_64.rpm'
					'https://kojipkgs.fedoraproject.org/packages/jbigkit/2.1/3.fc22/x86_64/jbigkit-libs-2.1-3.fc22.x86_64.rpm')
	md5sums=('3665195734fe43708ba2eef424ce3402' 'c69281653ca836f091f004289fa48de4'
					 '64ebe6a9f0ff9eddb396623730880ec5' 'efda764f71ffa977ed17756ca3c04846'
					 '72d7e7bb5ee120408932c15fca2a08e7' 'a260b56eb1652e631a21072b3585d4c5'
					 'b2bc95ae5cf7575b8588877b696235e3' '5cad00c04174c50d3d8d4132abf004cd' 'c4befcab085fb5d1bcf8fa18658cf2f9')
#	source=('http://repos.codelite.org/rpms/suse/codelite-8.1-1.suse13.2.x86_64.rpm' 'http://repos.codelite.org/wxCrafter-2.3/openSUSE/64/wxcrafter-2.3-1.x86_64.rpm')
#	md5sums=('5909fe2ceb87cda03fa260a688e22886' '39a3738f96ee35f5d0887b6337b0ed60')
fi

build() {
    cd $srcdir/
	if [[ $CARCH == x86_64 ]]; then
#		bsdtar -xf codelite_8.1-1.vivid_amd64.deb
#		tar xvJf data.tar.xz
#		bsdtar -xf wxcrafter_2.3-1.vivid_amd64.deb
#		tar xvJf data.tar.xz
#		mv ./usr/lib/x86_64-linux-gnu/codelite ./usr/lib/codelite
#		rmdir ./usr/lib/x86_64-linux-gnu 
#	else
#		bsdtar -xf codelite_8.1-1.vivid_i386.deb
#		tar xvJf data.tar.xz
#		bsdtar -xf wxcrafter_2.3-1.vivid_i386.deb
#		tar xvJf data.tar.xz
#		mv ./usr/lib/i386-linux-gnu/codelite ./usr/lib/codelite
#		rmdir ./usr/lib/i386-linux-gnu
#	fi
		mv ./usr/lib64 ./usr/lib
		mv ./usr/lib/lib* ./usr/lib/codelite/
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/abbreviation.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CallGraph.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CMakePlugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CodeFormatter.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CodeLiteDiff.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/codelitephp.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/ContinuousBuild.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Copyright.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/cppchecker.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/cscope.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/DatabaseExplorer.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/ExternalTools.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/git.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/HelpPlugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libdatabaselayersqlite.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/liblibcodelite.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libplugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libwxshapeframework.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libwxsqlite3.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/LLDBDebugger.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/MemCheck.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Outline.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/QMakePlugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/SFTP.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/SnipWiz.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/SpellCheck.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Subversion.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Tweaks.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/UnitTestsPP.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/WebTools.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Wizards.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/WordCompletion.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/wxCrafter.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/wxFormBuilder.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/ZoomNavigator.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/debuggers/DebuggerGDB.so

#		chrpath -r /usr/lib/codelite ./usr/bin/clg++
#		chrpath -r /usr/lib/codelite ./usr/bin/clgcc
		chrpath -r /usr/lib/codelite ./usr/bin/codelite
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-cc
		chrpath -r /usr/lib/codelite ./usr/bin/codelite_cppcheck
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-echo
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_exec
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_fix_files
		chrpath -r /usr/lib/codelite ./usr/bin/codelite_indexer
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_kill_children
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-lldb
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-make
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-terminal
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_xterm
	fi
#	rm $srcdir/usr/lib/codelite/libwx_*
  rm $srcdir/usr/bin/*jpeg*
  rm $srcdir/usr/bin/*jpg*
  rm $srcdir/usr/share/man/man1/*jpeg*
  rm $srcdir/usr/share/man/man1/*jpg*
	rm -rf $srcdir/usr/share/doc/jbigkit-libs
	rm -rf $srcdir/usr/share/doc/libtiff
	rm -rf $srcdir/usr/share/doc/libjpeg-6b
}

package() {
   cp -r $srcdir/usr $pkgdir
#	 ln -s /usr/lib/libclang.so $pkgdir/usr/lib/codelite/libclang-3.6.so.1
#	 ln -s /usr/lib/libjpeg.so $pkgdir/usr/lib/codelite/libjpeg.so.62
}
