# mdn

A script to manage markdown notes!

## Installing

Copy or clone this, then put or link `mdn` to somewhere in your $PATH.

## Usage

Add a new note called `my_note`:

```bash
$ mdn [my_note]
```

Delete `my_note`:

```bash
$ mdn del my_note
```

List all notes:

```bash
$ mdn list
```

Convert a note to PDF (requires pandoc):

```bash
$ mdn pdf my_note
```

Note: this requires you to set `$MDN_CSS_FILE` to the path to a CSS file
that controls the style of the document.

## ZSH Completions

...are available [here](https://github.com/lyneca/zsh-mdn-completion).
