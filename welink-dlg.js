// welink-wine: 将 Electron 的文件对话框与文件管理器调用桥接到 Linux 原生桌面 (xdg-desktop-portal)
'use strict';

if (process.env.WELINK_NATIVE_DIALOG !== '0') {
  try {
    const electron = require('electron');
    const net = require('net');
    const fs = require('fs');
    const os = require('os');
    const path = require('path');
    const { spawn } = require('child_process');

    const START_EXE = 'C:\\windows\\system32\\start.exe';
    const PYTHON_LINUX = '/usr/bin/python3';
    const HELPER_LINUX = '/opt/welink-wine/welink-filedialog.py';
    const PREFIX = (process.env.WINEPREFIX || '').replace(/\/+$/, '');
    const DRIVE_C = PREFIX ? `${PREFIX}/drive_c` : '';

    function winToLinux(p) {
      if (!p || typeof p !== 'string') return '';
      const s = p.trim();
      if (/^[zZ]:[\\/]/.test(s)) {
        return '/' + s.slice(3).replace(/\\/g, '/').replace(/^\/+/, '');
      }
      if (/^[cC]:[\\/]/.test(s) && DRIVE_C) {
        return DRIVE_C + '/' + s.slice(3).replace(/\\/g, '/').replace(/^\/+/, '');
      }
      if (s.startsWith('/')) return s;
      return '';
    }

    function linuxToWin(p) {
      if (!p || typeof p !== 'string') return '';
      if (DRIVE_C && (p === DRIVE_C || p.startsWith(DRIVE_C + '/'))) {
        const rel = p.slice(DRIVE_C.length).replace(/^\/+/, '').replace(/\//g, '\\');
        return 'C:\\' + rel;
      }
      return 'Z:' + p.replace(/\//g, '\\');
    }

    function parseArgs(arg1, arg2) {
      const BrowserWindow = electron.BrowserWindow;
      const isWin = (w) =>
        w &&
        typeof w === 'object' &&
        ((BrowserWindow && w instanceof BrowserWindow) || typeof w.webContents === 'object');
      const win = isWin(arg1) ? arg1 : null;
      const opts =
        (isWin(arg1) || arg1 == null) && arg2 !== undefined
          ? arg2
          : isWin(arg1)
          ? {}
          : arg1 || {};
      return { win, opts: opts && typeof opts === 'object' ? opts : {} };
    }

    function spawnLinuxPython(args) {
      const child = spawn(START_EXE, ['/b', '/unix', PYTHON_LINUX, '-I', HELPER_LINUX, ...args], {
        detached: true,
        stdio: 'ignore',
        windowsHide: true,
      });
      child.on('error', () => {});
      child.unref();
    }

    function callHelperAsync(req) {
      return new Promise((resolve, reject) => {
        let settled = false;
        const done = (err, val) => {
          if (settled) return;
          settled = true;
          try {
            server.close();
          } catch (_) {}
          if (err) reject(err);
          else resolve(val);
        };

        const server = net.createServer((sock) => {
          clearTimeout(connectTimer);
          let buf = '';
          sock.on('data', (chunk) => {
            buf += chunk.toString('utf8');
          });
          sock.on('end', () => {
            try {
              const res = JSON.parse(buf.trim());
              if (res && res.error) done(new Error(res.error));
              else done(null, res);
            } catch (e) {
              done(e);
            }
          });
          sock.on('error', (e) => done(e));
          try {
            sock.write(JSON.stringify(req) + '\n');
          } catch (e) {
            done(e);
          }
        });

        const connectTimer = setTimeout(() => {
          done(new Error('Helper connection timeout'));
        }, 4000);

        server.on('error', (e) => {
          clearTimeout(connectTimer);
          done(e);
        });

        server.listen(0, '127.0.0.1', () => {
          const port = server.address().port;
          try {
            spawnLinuxPython([String(port)]);
          } catch (e) {
            clearTimeout(connectTimer);
            done(e);
          }
        });
      });
    }

    function callHelperSync(req) {
      const tmpDir = os.tmpdir();
      const id = `${process.pid}_${Date.now()}_${Math.random().toString(36).slice(2)}`;
      const reqWin = path.join(tmpDir, `welink_fd_${id}.req.json`);
      const resWin = path.join(tmpDir, `welink_fd_${id}.res.json`);
      const reqLinux = winToLinux(reqWin);
      const resLinux = winToLinux(resWin);
      if (!reqLinux || !resLinux) throw new Error('Cannot resolve temp path');

      fs.writeFileSync(reqWin, JSON.stringify(req), 'utf8');
      try {
        spawnLinuxPython(['--file', reqLinux, resLinux]);

        const sab = new Int32Array(new SharedArrayBuffer(4));
        const start = Date.now();
        while (!fs.existsSync(resWin)) {
          if (Date.now() - start > 300000) throw new Error('Sync dialog timeout');
          Atomics.wait(sab, 0, 0, 30);
        }
        const raw = fs.readFileSync(resWin, 'utf8');
        const res = JSON.parse(raw);
        if (res && res.error) throw new Error(res.error);
        return res;
      } finally {
        try { fs.unlinkSync(reqWin); } catch (_) {}
        try { fs.unlinkSync(resWin); } catch (_) {}
      }
    }

    function buildOpenRequest(opts) {
      const props = Array.isArray(opts.properties) ? opts.properties : ['openFile'];
      return {
        action: 'dialog',
        mode: props.includes('openDirectory') ? 'folder' : 'open',
        title: typeof opts.title === 'string' ? opts.title : '',
        buttonLabel: typeof opts.buttonLabel === 'string' ? opts.buttonLabel : '',
        defaultPath: typeof opts.defaultPath === 'string' ? opts.defaultPath : '',
        filters: Array.isArray(opts.filters) ? opts.filters : [],
        multiple: props.includes('multiSelections'),
        showHidden: props.includes('showHiddenFiles'),
      };
    }

    function buildSaveRequest(opts) {
      return {
        action: 'dialog',
        mode: 'save',
        title: typeof opts.title === 'string' ? opts.title : '',
        buttonLabel: typeof opts.buttonLabel === 'string' ? opts.buttonLabel : '',
        defaultPath: typeof opts.defaultPath === 'string' ? opts.defaultPath : '',
        filters: Array.isArray(opts.filters) ? opts.filters : [],
      };
    }

    const dialog = electron.dialog;
    if (dialog) {
      const origShowOpenDialog = dialog.showOpenDialog.bind(dialog);
      const origShowOpenDialogSync = dialog.showOpenDialogSync.bind(dialog);
      const origShowSaveDialog = dialog.showSaveDialog.bind(dialog);
      const origShowSaveDialogSync = dialog.showSaveDialogSync.bind(dialog);

      dialog.showOpenDialog = async function (arg1, arg2) {
        const { opts } = parseArgs(arg1, arg2);
        try {
          const res = await callHelperAsync(buildOpenRequest(opts));
          const filePaths = (res.paths || []).map(linuxToWin).filter(Boolean);
          return {
            canceled: Boolean(res.canceled || filePaths.length === 0),
            filePaths,
          };
        } catch (_) {
          return origShowOpenDialog(arg1, arg2);
        }
      };

      dialog.showOpenDialogSync = function (arg1, arg2) {
        const { opts } = parseArgs(arg1, arg2);
        try {
          const res = callHelperSync(buildOpenRequest(opts));
          if (res.canceled || !res.paths || res.paths.length === 0) return undefined;
          return res.paths.map(linuxToWin).filter(Boolean);
        } catch (_) {
          return origShowOpenDialogSync(arg1, arg2);
        }
      };

      dialog.showSaveDialog = async function (arg1, arg2) {
        const { opts } = parseArgs(arg1, arg2);
        try {
          const res = await callHelperAsync(buildSaveRequest(opts));
          const filePaths = (res.paths || []).map(linuxToWin).filter(Boolean);
          if (res.canceled || filePaths.length === 0) {
            return { canceled: true, filePath: '' };
          }
          return { canceled: false, filePath: filePaths[0] };
        } catch (_) {
          return origShowSaveDialog(arg1, arg2);
        }
      };

      dialog.showSaveDialogSync = function (arg1, arg2) {
        const { opts } = parseArgs(arg1, arg2);
        try {
          const res = callHelperSync(buildSaveRequest(opts));
          if (res.canceled || !res.paths || res.paths.length === 0) return undefined;
          return linuxToWin(res.paths[0]);
        } catch (_) {
          return origShowSaveDialogSync(arg1, arg2);
        }
      };
    }

    const shell = electron.shell;
    if (shell && typeof shell.showItemInFolder === 'function') {
      const origShowItemInFolder = shell.showItemInFolder.bind(shell);
      shell.showItemInFolder = function (fullPath) {
        if (fullPath && typeof fullPath === 'string') {
          callHelperAsync({ action: 'showItemInFolder', path: fullPath }).catch(() => {
            origShowItemInFolder(fullPath);
          });
          return;
        }
        return origShowItemInFolder(fullPath);
      };
    }
  } catch (_) {}
}
