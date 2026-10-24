
;(() => {
  if (process.platform !== 'linux') return
  const { ipcRenderer } = require('electron')

  const ICONS = {
    minimize: '<path d="M3 8h10"/>',
    maximize: '<rect x="3.25" y="3.25" width="9.5" height="9.5" rx="2"/>',
    restore: '<path d="M5.5 5.25v-.5a1.5 1.5 0 0 1 1.5-1.5h4.25a1.5 1.5 0 0 1 1.5 1.5V9a1.5 1.5 0 0 1-1.5 1.5h-.5"/><rect x="3.25" y="5.5" width="7.25" height="7.25" rx="1.75"/>',
    close: '<path d="M4 4l8 8M12 4l-8 8"/>',
  }
  const LABELS = { minimize: 'Minimize', maximize: 'Maximize', restore: 'Restore', close: 'Close' }

  const CSS = `
    :host { all: initial; position: fixed; top: 4px; right: 6px; z-index: 2147483647;
            -webkit-app-region: no-drag; font-family: inherit; }
    .bar { display: flex; gap: 2px; align-items: center; height: 28px;
           transition: opacity .15s ease; }
    :host(.blur) .bar { opacity: .5; }
    :host(.fullscreen) { display: none; }
    button { all: unset; box-sizing: border-box; width: 30px; height: 26px; border-radius: 6px;
             display: grid; place-items: center; cursor: default;
             color: var(--color-text-tertiary, #8a8f98);
             -webkit-app-region: no-drag;
             transition: background-color .12s ease, color .12s ease; }
    button:hover { color: var(--color-text-primary, #f7f8f8);
                   background: color-mix(in srgb, var(--color-text-primary, #f7f8f8) 8%, transparent); }
    button:active { background: color-mix(in srgb, var(--color-text-primary, #f7f8f8) 14%, transparent); }
    button:focus-visible { outline: 2px solid var(--color-accent, #5e6ad2); outline-offset: -2px; }
    button.close:hover { color: #fff; background: var(--color-red, #eb5757); }
    button.close:active { background: color-mix(in srgb, var(--color-red, #eb5757) 80%, black); }
    svg { width: 14px; height: 14px; fill: none; stroke: currentColor; stroke-width: 1.3;
          stroke-linecap: round; stroke-linejoin: round; pointer-events: none; }
  `

  const mount = () => {
    const host = document.createElement('div')
    host.id = 'linear-linux-window-controls'
    const root = host.attachShadow({ mode: 'closed' })
    const style = document.createElement('style')
    style.textContent = CSS
    const bar = document.createElement('div')
    bar.className = 'bar'
    const buttons = {}
    for (const action of ['minimize', 'maximize', 'close']) {
      const button = document.createElement('button')
      button.className = action
      button.type = 'button'
      button.tabIndex = -1
      button.addEventListener('click', () => ipcRenderer.send('linux-chrome:action', action))
      bar.append(button)
      buttons[action] = button
    }
    const paint = (action, icon) => {
      buttons[action].innerHTML = `<svg viewBox="0 0 16 16" aria-hidden="true">${ICONS[icon]}</svg>`
      buttons[action].title = LABELS[icon]
      buttons[action].setAttribute('aria-label', LABELS[icon])
    }
    paint('minimize', 'minimize')
    paint('maximize', 'maximize')
    paint('close', 'close')
    root.append(style, bar)

    ipcRenderer.on('linux-chrome:state', (_event, state) => {
      paint('maximize', state.maximized ? 'restore' : 'maximize')
      host.classList.toggle('fullscreen', Boolean(state.fullscreen))
    })
    // Linear toggles html.blur when the window loses focus.
    const syncBlur = () => host.classList.toggle('blur', document.documentElement.classList.contains('blur'))
    new MutationObserver(syncBlur).observe(document.documentElement, { attributes: true, attributeFilter: ['class'] })
    syncBlur()

    document.documentElement.append(host)
  }

  if (document.documentElement) mount()
  else document.addEventListener('DOMContentLoaded', mount, { once: true })
})()
