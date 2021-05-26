RPG_CLI=/usr/bin/rpg-cli
rpg () {
  $RPG_CLI "$@"
  cd "$($RPG_CLI --pwd)"
}
