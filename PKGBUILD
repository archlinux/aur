# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-classic
pkgver=v0.11.2.cl1
_vertemp=${pkgver%.*}
_ver=${_vertemp#v}
pkgrel=1
pkgdesc='Official Bitcoin Classic binaries: bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt with auto setup of RPC SSL'
arch=('i686' 'x86_64')
url="https://bitcoinclassic.com/"
license=('MIT')
depends=('boost-libs' 'openssl' 'miniupnpc' 'protobuf' 'qrencode' 'qt5-base')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source_i686=("https://github.com/bitcoinclassic/bitcoinclassic/releases/download/$pkgver/bitcoin-$_ver-linux32.tar.gz"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/contrib/debian/bitcoin-qt.desktop"
						 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/share/pixmaps/bitcoin128.png"
						 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/contrib/debian/manpages/bitcoind.1"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/0.11.2/contrib/debian/manpages/bitcoin-cli.1"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/0.11.2/contrib/debian/manpages/bitcoin-qt.1"
             "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/contrib/debian/manpages/bitcoin.conf.5"
						 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/0.11.2/COPYING"
						 "bitcoin.conf")
source_x86_64=("https://github.com/bitcoinclassic/bitcoinclassic/releases/download/$pkgver/bitcoin-$_ver-linux64.tar.gz"
               "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/contrib/debian/bitcoin-qt.desktop"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/share/pixmaps/bitcoin128.png"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/contrib/debian/manpages/bitcoind.1"
               "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/0.11.2/contrib/debian/manpages/bitcoin-cli.1"
               "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/0.11.2/contrib/debian/manpages/bitcoin-qt.1"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/$_ver/contrib/debian/manpages/bitcoin.conf.5"
							 "https://raw.githubusercontent.com/bitcoinclassic/bitcoinclassic/0.11.2/COPYING"
							 "bitcoin.conf")
noextract=(bitcoin-$_ver-linux*.tar.gz)
md5sums_i686=('7647477343116b9d1f41af83c0ddf1fb'
              '0aa8db6ac0e58ccbe85d0fe4923fb39e'
              '0aae5f0110179e8e1d588530bcce5d2a'
              '1f72f650f0d8e76fbaf86fd5809e73b2'
              '5982de61dec5a2b0632e7235af04d412'
              '29d251c3399f497cda973f6a3e06b322'
              '62981ec22f92add684406addc5e4d03a'
              'fb8504ceaf8aa25d43eefc5f90abfa06'
              'aee806a767f350dab8bfb39db0ee0e18')
md5sums_x86_64=('50f9362cb8e91cfb82a6fea48b1c37f2'
                '0aa8db6ac0e58ccbe85d0fe4923fb39e'
                '0aae5f0110179e8e1d588530bcce5d2a'
                '1f72f650f0d8e76fbaf86fd5809e73b2'
                '5982de61dec5a2b0632e7235af04d412'
                '29d251c3399f497cda973f6a3e06b322'
                '62981ec22f92add684406addc5e4d03a'
                'fb8504ceaf8aa25d43eefc5f90abfa06'
                'aee806a767f350dab8bfb39db0ee0e18')
sha256sums_i686=('05d4b11b46ebae557f747674f59603a625a11e7e62cb78e1c50825b7e2ebd734'
                 'b65b377c0d9ecae9eea722843bca0add6bdb7e50929a7e1f751b79b6621c6073'
                 'ad880c8459ecfdb96abe6a4689af06bdd27906e0edcd39d0915482f2da91e722'
                 '829d5d38c8c3145b6debcb569bfa75acdfcfab5d914495b56ceb4d02060f130f'
                 '321c67742faf093c3d7a0dddef58adc942e85eddb34a9202755945f8997e0f13'
                 '47ecf202c41cafc90f15db67bdeb9d448cf6c20f96745fcad7bdfc24b5c21ff9'
                 '9acf7f46052f6e508af4f38be4574f34bf0f57d2cf462f072606d3f177b4c957'
                 '8973ffc8689564898d52b54dc27d3cacf7aa3b61d6fcc390da40e773ad7dffed'
                 '938f4265e238cbc038ebee9cb93076a8ba0ae94708ac7b7379385b1f8d019676')
sha256sums_x86_64=('3f4eb95a832c205d1fe3b3f4537df667f17f3a6be61416d11597feb666bde4ca'
                   'b65b377c0d9ecae9eea722843bca0add6bdb7e50929a7e1f751b79b6621c6073'
                   'ad880c8459ecfdb96abe6a4689af06bdd27906e0edcd39d0915482f2da91e722'
                   '829d5d38c8c3145b6debcb569bfa75acdfcfab5d914495b56ceb4d02060f130f'
                   '321c67742faf093c3d7a0dddef58adc942e85eddb34a9202755945f8997e0f13'
                   '47ecf202c41cafc90f15db67bdeb9d448cf6c20f96745fcad7bdfc24b5c21ff9'
                   '9acf7f46052f6e508af4f38be4574f34bf0f57d2cf462f072606d3f177b4c957'
                   '8973ffc8689564898d52b54dc27d3cacf7aa3b61d6fcc390da40e773ad7dffed'
                   '938f4265e238cbc038ebee9cb93076a8ba0ae94708ac7b7379385b1f8d019676')

package() {
  msg2 "Extracting and installing binaries..."
  bsdtar -C "$pkgdir" -xf bitcoin-*-linux*.tar.gz
  mv $pkgdir/bitcoin-* "$pkgdir/usr"
  rm $pkgdir/usr/bin/test_*

  msg2 'Installing license...'
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  msg2 "Installing man pages..."
  install -Dm644 "$srcdir/bitcoind.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "$srcdir/bitcoin-cli.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "$srcdir/bitcoin-qt.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "$srcdir/bitcoin.conf.5" -t "$pkgdir/usr/share/man/man5"

#  msg2 'Installing bitcoin.conf if one does not already exist...'
#  [[ ! -e "$HOME/.bitcoin/bitcoin.conf" ]] && install -Dm 600 "$srcdir/bitcoin.conf" \
#	-t "$pkgdir$HOME/.bitcoin"

#  msg2 "Placing proper home directory location in .install file..."
#	sed -i "s|\$HOME|$HOME|g" $startdir/bitcoin-qt.install

	msg2 'Installing icon...'
	install -Dm644 "$srcdir/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"

	msg2 'Installing desktop file...'
	mv "$srcdir/bitcoin-qt.desktop" "$srcdir/bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"
}
