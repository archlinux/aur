# PDFrrr

🔃 Rotate pdf pages automatically

## Requirements

- [sed](https://www.gnu.org/software/sed/)
- [pdftk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)
- [pdftoppm](https://poppler.freedesktop.org/)
- [tesseract](https://github.com/tesseract-ocr/tesseract)

## Installation

### AUR

```sh
yay -S pdfrrr
```

### Manual

Clone the repo or download [`pdfrrr`](./pdfrrr) and make it executable.
It can be placed into `PATH` for convenience.

```sh
wget https://raw.githubusercontent.com/Zebradil/pdfrrr/master/pdfrrr
chmod +x pdfrrr
# Assuming you have `~/bin` set in your `PATH`
mv pdfrrr ~/bin/
```

## Usage

PDFrrr rotates pages in the provided pdf file in-place. Take a copy of the source file beforehand.

```sh
cp input.pdf input.pdf.bak
./pdfrrr input.pdf
```

## How it works

1. Convert pdf to images using `pdftoppm` (in a temp directory)
2. With `tesseract`, identify pages which need to be rotated and required rotation direction
3. Rotate selected pages with `pdftk`, creating temporary file with correct rotation
4. Overwrite the source file with the new one
5. Clean up temporary directory

## License

Licensed under [the MIT License][./license].

By [German Lashevich][https://github.com/zebradil].
