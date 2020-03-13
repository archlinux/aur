const regexes = [
  // en
  /whatsapp works with.*to use whatsapp.*update/i,
  // es
  /whatsapp funciona con.*para usar whatsapp.*actualiza/i,
  // pt
  /o whatsapp funciona com.*para utilizar o whatsapp.*atualize/i,
  // ge
  /whatsapp funktioniert mit.*um whatsapp zu benutzen.*aktualisiere/i
]

for (const regex of regexes) {
  if (document.body.innerText.replace(/\n/g, ' ').search(regex) !== -1) {
    navigator.serviceWorker.getRegistration().then(function (r) { r.unregister(); document.location.reload() });
    return;
  }
}
