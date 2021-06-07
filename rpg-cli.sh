rpg () {
  case "${1}" in
    buy | use | battle | stat)
      rpg-cli "${@}"
      ;;
    *)
      cd "${@}" && rpg-cli cd "${PWD}"
      ;;
  esac
}
