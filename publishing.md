# Pubblicazione in AUR

penguins-eggs (stable) è pubblicato su [AUR](https://aur.archlinux.org/packages/penguins-eggs) (solo lettura)


# La chiave
Per l'accesso in scrittura ad AUR, è necessario disporre di una coppia di chiavi SSH. Il contenuto della chiave pubblica deve essere copiato nel proprio profilo in My Account e la chiave privata corrispondente deve essere configurata per l'host aur.archlinux.org. Ad esempio:
```
~/.ssh/config
Host aur.archlinux.org
  IdentityFile ~/.ssh/aur
  User aur
```

È consigliabile creare una nuova coppia di chiavi piuttosto che utilizzarne una esistente, in modo da poter revocare selettivamente le chiavi in caso di problemi:

```
ssh-keygen -f ~/.ssh/aur

```

Suggerimento: è possibile aggiungere più chiavi pubbliche al proprio profilo separandole con un trattino nel campo di immissione.

# Push su AUR

Per aggiornare, occorre eseguire il clone per lettura/scrittura con un utente in possesso della chiave privata che DEVE essere copiata in ~/.ssh/:

```
git clone ssh://aur@aur.archlinux.org/penguins-eggs.git
```

## .SRCINFO
Prima di poter pubblicare occorre ri-creare il file .SRCINFO con il comando:

```
makepkg --printsrcinfo > .SRCINFO
```

Quindi, si effettua normalmente il push:
```
git add -A
git commit -m "modifiche effettuate"
git push
```

# Pulizia
Rimozione di tutti i file untracked:
```
git clean -dfX
```
