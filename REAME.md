# fsed

Rename files in batch.

## Dry-run

By default, `fsed` will print renamed file names:

```bash
> ls
foo.txt   bar.txt
> fsed 's/\.txt/.png/' *.txt
foo.png   bar.png
```

## Rename in batch

```bash
> ls
foo.txt   bar.txt
> fsed -i 's/\.txt/.png/' *.txt
> ls
foo.png   bar.png
```