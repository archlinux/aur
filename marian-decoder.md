---
title: marian-decoder
section: 1
header: Bergamont translator quickstart
---

# NAME

marian-decoder - the browser.mt fork of marian_decoder

# SYNOPSIS

```
echo "text to translate" | \
marian-decoder \
	-m model.bin\
	-v vocab.spm vocab.spm \
	--shortlist lex.s2t.bin false \
	--model-mmap --cpu-threads 2 --quiet
```

# DESCRIPTION

The models can be found in the folder 
`/usr/share/firefox-translations-models/prod`, each folder describes
the language from and to the model translates.

More help on the command can be found by running `marian-decoder --help`.


# BUGS

This man page is currently provided as part of the AUR package for using
the Bergamont translator on the command line. It is a stub, I know.
Improvements are currently handled as AUR comments on the package.


