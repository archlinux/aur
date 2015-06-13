# Maintainer: SanskritFritz (gmail)

pkgname=("pzl_common" "pzl_boggle" "pzl_codeword" "pzl_futoshiki" "pzl_jigsaw" "pzl_kakuro" "pzl_minesweeper" "pzl_scrabbler" "pzl_sumpuzzle" "pzl_sudoku" "pzl_sokoban")
pkgbase="pzl_games"
pkgver=3.5
_pkgver=3_5
pkgrel=1
pkgdesc="Small collection of computer games."
arch=('any')
url="http://pzl.org.uk/"
license=('GPL')
source=("http://pzl.org.uk/pzl_$_pkgver.zip"
	"pzl_boggle.desktop"
	"pzl_codeword.desktop"
	"pzl_futoshiki.desktop"
	"pzl_jigsaw.desktop"
	"pzl_kakuro.desktop"
	"pzl_minesweeper.desktop"
	"pzl_scrabbler.desktop"
	"pzl_sumpuzzle.desktop"
	"pzl_sudoku.desktop"
	"pzl_sokoban.desktop" )

prepare() {
	sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" pzl_download/*.py*
}


package_pzl_common() {
	pkgdesc="Common files for pzl games."
	depends=('tk' 'python2')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/*.py "$pkgdir/usr/share/pzl_games"
}

package_pzl_boggle() {
	pkgdesc="Find as many words as possible in a grid of letters."
	url="http://pzl.org.uk/boggle.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/boggle.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/boggle_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_boggle.desktop "$pkgdir/usr/share/applications"
}

package_pzl_codeword() {
	pkgdesc="Challenging crossword pattern recognition game."
	url="http://pzl.org.uk/codeword.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/codeword.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/codeword_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_codeword.desktop "$pkgdir/usr/share/applications"
}

package_pzl_futoshiki() {
	pkgdesc="Logic game in which players solve a Latin square."
	url="http://pzl.org.uk/futoshiki.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/futoshiki.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/futoshiki_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_futoshiki.desktop "$pkgdir/usr/share/applications"
}

package_pzl_jigsaw() {
	pkgdesc="Puzzle game to assemble segments of a picture into their positions."
	url="http://pzl.org.uk/jigsaw.html"
	depends=('python2-pillow' 'pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/jigsaw.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/jigsaw_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_jigsaw.desktop "$pkgdir/usr/share/applications"
}

package_pzl_kakuro() {
	pkgdesc="An absorbing logic game."
	url="http://pzl.org.uk/kakuro.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/kakuro.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/kakuro_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_kakuro.desktop "$pkgdir/usr/share/applications"
}

package_pzl_minesweeper() {
	pkgdesc="Minesweeper game which will always produce puzzles that can be solved using logic."
	url="http://pzl.org.uk/minesweeper.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/minesweeper.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/minesweeper_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_minesweeper.desktop "$pkgdir/usr/share/applications"
}

package_pzl_scrabbler() {
	pkgdesc="Make words on the board using randomly allotted letters."
	url="http://pzl.org.uk/scrabbler.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/scrabbler.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/scrabbler_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_scrabbler.desktop "$pkgdir/usr/share/applications"
}

package_pzl_sumpuzzle() {
	pkgdesc="Test of logic and simple arithmetic in which the player positions numbers to satisfy six intersecting sums."
	url="http://pzl.org.uk/sumpuzzle.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/sumpuzzle.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/sumpuzzle_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_sumpuzzle.desktop "$pkgdir/usr/share/applications"
}

package_pzl_sudoku() {
	pkgdesc="The popular logic game."
	url="http://pzl.org.uk/sudoku.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/sudoku.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/sudoku_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_sudoku.desktop "$pkgdir/usr/share/applications"
}

package_pzl_sokoban() {
	pkgdesc="The warehouse keeper must push boxes to designated positions."
	url="http://pzl.org.uk/sokoban.html"
	depends=('pzl_common')
	install -dm755 "$pkgdir"/usr/share/{applications,pixmaps/pzl_games,pzl_games}
	cp pzl_download/sokoban.pyw "$pkgdir/usr/share/pzl_games"
	cp pzl_download/sokoban_icon.png "$pkgdir/usr/share/pixmaps/pzl_games"
	cp pzl_sokoban.desktop "$pkgdir/usr/share/applications"
}

md5sums=('1ef78396f3c62cec59ca409f5d67398f'
         '68db7ca30579f312bfcf274f8dbdd406'
         '3fe6e4760000ec42505601ef74ec9d31'
         '25e7079b6867a9465b79d77e3f30d3c8'
         '4c56394fc8e6c31f2da61727e0dccfb5'
         '3bf4816d7aa6fe5b0bba231831e390c4'
         'dce4907232ffbbb173053771dd38a393'
         'a59c4ccadb776f5e0f45d5a70345cd96'
         '0909be64599ffb306e5081ebd82138a2'
         '13cefc5e33b8df09001a3834e8d81cd2'
         '3b3797fbb8dd8ac7b9c64a940ef893e9')
