import struct, json, sys, os
from pathlib import Path

# ── helpers ────────────────────────────────────────────────────────────────

def read_asar_header(raw):
    u0, hps, _pls, jl = struct.unpack_from('<IIII', raw, 0)
    if u0 != 4:
        raise ValueError(f"Unexpected asar magic: {u0}")
    return json.loads(raw[16:16 + jl].decode('utf-8')), jl, 8 + hps

def update_offsets(node, pivot, delta):
    for child in node.get('files', {}).values():
        update_offsets(child, pivot, delta)
    if 'offset' in node and int(node['offset']) > pivot:
        node['offset'] = str(int(node['offset']) + delta)

def patch_asar_file(raw, header, dss, entry, patches, marker=None, default_critical=True):
    """Patch one file inside the asar. Returns (new_raw, new_dss)."""
    roff  = int(entry['offset'])
    rsize = int(entry['size'])
    abs_start = dss + roff
    abs_end   = abs_start + rsize

    content = raw[abs_start:abs_end].decode('utf-8')
    if marker and marker in content:
        content = content.replace(marker, '', 1)

    failed = []
    for p in patches:
        if p['old'] not in content:
            if p['new'] in content:
                print(f'    [SKIP] {p["name"]}')
            else:
                print(f'    [WARN] pattern not found: {p["name"]}', file=sys.stderr)
                if p.get('critical', default_critical):
                    failed.append(p['name'])
            continue
        content = content.replace(p['old'], p['new'], 1)
        print(f'    [OK]   {p["name"]}')

    if failed:
        print(f'\nERROR: {len(failed)} critical patch(es) failed to apply:', file=sys.stderr)
        for name in failed:
            print(f'  - {name}', file=sys.stderr)
        print('The renderer.js compiled output may have changed upstream.', file=sys.stderr)
        sys.exit(1)

    if marker:
        content = marker + content

    new_bytes = content.encode('utf-8')
    delta = len(new_bytes) - rsize
    entry['size'] = len(new_bytes)
    update_offsets(header, roff, delta)

    j = json.dumps(header, separators=(',', ':')).encode('utf-8')
    n = len(j)
    new_raw = struct.pack('<IIII', 4, 8+n, 4+n, n) + j + raw[dss:abs_start] + new_bytes + raw[abs_end:]
    new_dss = 8 + struct.unpack_from('<I', new_raw, 4)[0]
    return new_raw, new_dss

# ── asar patch definitions ─────────────────────────────────────────────────

PATCH_MARKER = "// vortex-linux-fix-v8\n"

RENDERER_PATCHES = [
    {
        "name": "File browser filter — accept Linux executables alongside .exe",
        "old": 'filters:[{name:"Images",extensions:["png","jpg","ico"]},{name:"Executables",extensions:["exe"]}]',
        "new": 'filters:[{name:"Images",extensions:["png","jpg","ico"]},{name:"Executables",extensions:"linux"===process.platform?["x86_64","x86","sh","*"]:["exe"]}]',
    },
    {
        "name": "verifyToolDir — .exe → .x86_64 fallback on Linux (profile/game-mode validation)",
        "old": (
            'function verifyToolDir(tool,testPath){return bluebird_1.default.mapSeries(tool.requiredFiles,'
            'fileName=>fsExtra.stat(path.join(testPath,fileName)).catch(err=>bluebird_1.default.reject(err))).then(()=>{})}'
        ),
        "new": (
            'function verifyToolDir(tool,testPath){return bluebird_1.default.mapSeries(tool.requiredFiles,'
            'fileName=>"linux"===process.platform'
            '?fsExtra.stat(path.join(testPath,fileName)).catch(()=>fsExtra.stat(path.join(testPath,fileName.replace(/\\.exe$/i,".x86_64"))))'
            ':fsExtra.stat(path.join(testPath,fileName)).catch(err=>bluebird_1.default.reject(err))).then(()=>{})}'
        ),
    },
    {
        "name": "requiredFiles validator — .exe → .x86_64 fallback on Linux",
        "old": (
            'requiredFiles||[],file=>bluebird_1.default.resolve('
            'fsExtra.stat(path.join(gamePath,file)))).then(()=>{}).'
            'catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})'
        ),
        "new": (
            'requiredFiles||[],file=>bluebird_1.default.resolve('
            '"linux"===process.platform'
            '?fsExtra.stat(path.join(gamePath,file)).catch(()=>fsExtra.stat(path.join(gamePath,file.replace(/\\.exe$/i,".x86_64"))))'
            ':fsExtra.stat(path.join(gamePath,file)))).then(()=>{}).'
            'catch(err=>{if("ENOENT"===err.code)return bluebird_1.default.reject(err)})'
        ),
    },
    {
        "name": "StarterInfo.initFromGame — resolve native Linux binary",
        "old": (
            'this.exePath=path.join(gameDiscovery.path,gameDiscovery.executable||game.executable),'
            'this.commandLine='
        ),
        "new": (
            'this.exePath=(()=>{'
            'const r=gameDiscovery.executable||game.executable,'
            'f=path.join(gameDiscovery.path,r);'
            'if("linux"!==process.platform||!r||!/\\.exe$/i.test(r)||fs.existsSync(f))return f;'
            'const f86=path.join(gameDiscovery.path,r.replace(/\\.exe$/i,".x86_64"));'
            'if(fs.existsSync(f86))return f86;'
            'const fSh=path.join(gameDiscovery.path,"linux","run-client.sh");'
            'if(fs.existsSync(fSh))return fSh;'
            'const fBin=path.join(gameDiscovery.path,"linux",path.basename(r,path.extname(r)));'
            'if(fs.existsSync(fBin))return fBin;'
            'return f;'
            '})(),'
            'this.commandLine='
        ),
    },
    {
        "name": "browseGameLocation — skip identifyStore on Linux",
        "old": (
            '.then(corrected=>function manualGameStoreSelection(api,correctedGamePath)'
            '{const gameStores=(0,getGame_1.getGameStores)();'
            'return GameStoreHelper_1.default.identifyStore(correctedGamePath).then(storeId=>{'
        ),
        "new": (
            '.then(corrected=>"linux"===process.platform'
            '?bluebird_1.default.resolve({corrected,store:"steam"})'
            ':function manualGameStoreSelection(api,correctedGamePath)'
            '{const gameStores=(0,getGame_1.getGameStores)();'
            'return GameStoreHelper_1.default.identifyStore(correctedGamePath).then(storeId=>{'
        ),
    },
    {
        "name": "iniFiles — resolve mygames via Proton prefix on Linux (Fallout4/Skyrim INI fix)",
        "old": (
            'const mygames=path.join((0,getVortexPath_1.default)("documents"),"My Games");'
        ),
        "new": (
            'const mygames=(()=>{'
            'if("linux"!==process.platform)return path.join((0,getVortexPath_1.default)("documents"),"My Games");'
            'const _fs=require("fs");'
            'const discPath=discovery?.path;'
            'if(!discPath)return path.join((0,getVortexPath_1.default)("documents"),"My Games");'
            'const normDisc=path.normalize(discPath);'
            'const cands=[];'
            'const mc=path.dirname(normDisc);'
            'const ms=path.dirname(mc);'
            'if(path.basename(mc)==="common")cands.push(ms);'
            'const home=process.env.HOME;'
            'cands.push(path.join(home,".steam","steam","steamapps"));'
            'try{'
            'const lf=path.join(home,".steam","steam","steamapps","libraryfolders.vdf");'
            'const lfTxt=_fs.readFileSync(lf,"utf8");'
            'for(const m of lfTxt.matchAll(/"path"\\s+"([^"]+)"/g))cands.push(path.join(m[1],"steamapps"));'
            '}catch(e){}'
            'for(const sd of[...new Set(cands)]){'
            'try{'
            'const mfs=_fs.readdirSync(sd).filter(f=>f.startsWith("appmanifest_")&&f.endsWith(".acf"));'
            'for(const mf of mfs){'
            'try{'
            'const mt=_fs.readFileSync(path.join(sd,mf),"utf8");'
            'const im=mt.match(/"installdir"\\s+"([^"]+)"/);'
            'if(im&&path.normalize(path.join(sd,"common",im[1]))===normDisc){'
            'const idm=mf.match(/appmanifest_(\\d+)\\.acf/);'
            'if(idm){'
            'const mg=path.join(sd,"compatdata",idm[1],"pfx","drive_c","users","steamuser","Documents","My Games");'
            'if(_fs.existsSync(mg))return mg;'
            '}'
            '}'
            '}catch(e){}'
            '}'
            '}catch(e){}'
            '}'
            'return path.join((0,getVortexPath_1.default)("documents"),"My Games");'
            '})();'
        ),
    },
    {
        "name": "epicGamesLauncher — stub on Linux (prevent null-ref crashes)",
        "old": "exports.epicGamesLauncher=EpicGamesLauncher_1.default;",
        "new": (
            'exports.epicGamesLauncher="linux"===process.platform'
            '?{findByAppId:()=>Promise.reject(new Error("Epic not available on Linux")),'
            'isGameInstalled:()=>Promise.resolve(!1),'
            'queryPath:()=>Promise.reject(new Error("Epic not available on Linux")),'
            'getAppById:()=>void 0}'
            ':EpicGamesLauncher_1.default;'
        ),
    },
    {
        "name": "testExecProvider — detect .NET deps.json version on Linux when exe has no PE version",
        "old": (
            'exports.testExecProvider=async function testExecProvider(game,discovery){'
            'const exeName=discovery.executable||game.executable();'
            'if(void 0===discovery?.path||void 0===exeName)return Promise.resolve(!1);'
            'const exePath=path_1.default.join(discovery.path,exeName);'
            'try{await(0,fs_1.statAsync)(exePath);'
            'return"0.0.0"===exeVersion.default(exePath)?Promise.resolve(!1):Promise.resolve(!0)}'
            'catch(err){return(0,log_1.log)("error","unable to test executable version fields",err),Promise.resolve(!1)}}'
        ),
        "new": (
            'exports.testExecProvider=async function testExecProvider(game,discovery){'
            'const exeName=discovery.executable||game.executable();'
            'if(void 0===discovery?.path||void 0===exeName)return Promise.resolve(!1);'
            'const exePath=path_1.default.join(discovery.path,exeName);'
            'try{await(0,fs_1.statAsync)(exePath);'
            'let _ev;try{_ev=exeVersion.default(exePath)||"0.0.0"}catch(e){_ev="0.0.0"}'
            'if("0.0.0"!==_ev)return Promise.resolve(!0);'
            'if("linux"===process.platform){'
            'const _lfs=require("fs");'
            'try{'
            'const _norm=s=>s.toLowerCase().replace(/[\\s.\\-_]/g,"");'
            'const _en=_norm(path_1.default.basename(exePath).replace(/\\.[^.]+$/,""));'
            'const _fls=_lfs.readdirSync(discovery.path).filter(f=>f.endsWith(".deps.json"));'
            'for(const _f of _fls){'
            'try{'
            'const _d=JSON.parse(_lfs.readFileSync(path_1.default.join(discovery.path,_f),"utf8"));'
            'for(const _lib of Object.keys(_d.libraries||{})){'
            'const _si=_lib.indexOf("/");if(_si<0)continue;'
            'const _lv=_lib.substring(_si+1);if(!_lv||"0.0.0"===_lv)continue;'
            'const _ln=_norm(_lib.substring(0,_si));'
            'if(_ln===_en||_ln.startsWith(_en)||_en.startsWith(_ln))return Promise.resolve(!0)'
            '}}catch(e){}}'
            '}catch(e){}}'
            'return Promise.resolve(!1)}'
            'catch(err){return(0,log_1.log)("error","unable to test executable version fields",err),Promise.resolve(!1)}}'
        ),
    },
    {
        "name": "getExecGameVersion — read .NET deps.json version on Linux as fallback",
        "old": (
            'exports.getExecGameVersion=async function getExecGameVersion(game,discovery){'
            'const exePath=path_1.default.join(discovery.path,discovery.executable||game.executable());'
            'try{const version=exeVersion.default(exePath);return Promise.resolve(version)}'
            'catch(err){return Promise.resolve("0.0.0")}};'
        ),
        "new": (
            'exports.getExecGameVersion=async function getExecGameVersion(game,discovery){'
            'const exePath=path_1.default.join(discovery.path,discovery.executable||game.executable());'
            'let _ver;try{_ver=exeVersion.default(exePath)||"0.0.0"}catch(err){_ver="0.0.0"}'
            'if("linux"===process.platform&&"0.0.0"===_ver){'
            'const _lfs=require("fs");'
            'try{'
            'const _norm=s=>s.toLowerCase().replace(/[\\s.\\-_]/g,"");'
            'const _en=_norm(path_1.default.basename(exePath).replace(/\\.[^.]+$/,""));'
            'const _fls=_lfs.readdirSync(discovery.path).filter(f=>f.endsWith(".deps.json"));'
            'let _best=null,_bsc=-1,_done=!1;'
            'for(const _f of _fls){'
            'if(_done)break;'
            'try{'
            'const _d=JSON.parse(_lfs.readFileSync(path_1.default.join(discovery.path,_f),"utf8"));'
            'for(const _lib of Object.keys(_d.libraries||{})){'
            'const _si=_lib.indexOf("/");if(_si<0)continue;'
            'const _lv=_lib.substring(_si+1);if(!_lv||"0.0.0"===_lv)continue;'
            'const _ln=_norm(_lib.substring(0,_si));'
            'const _sc=_ln===_en?2:_ln.startsWith(_en)||_en.startsWith(_ln)?1:0;'
            'if(_sc>_bsc){_bsc=_sc;_best=_lv}'
            'if(_bsc>=2){_done=!0;break}'
            '}}catch(e){}}'
            'if(_best&&_bsc>=1)_ver=_best'
            '}catch(e){}}'
            'return Promise.resolve(_ver)};'
        ),
    },
    # Migration patches: not critical — expected to [SKIP] on fresh AUR builds.
    # They only fire [OK] on locally-patched asars still on older code.
    # v6→v7: adds ||"0.0.0" guard so exeVersion.default() never returns undefined on Linux.
    # On fresh AUR builds these will be [SKIP] (v6 old not found, v7 new already present).
    # On a locally v6-patched asar these fire as [OK].
    {
        "name": "testExecProvider — v6→v7 migration: handle exeVersion returning undefined on Linux",
        "critical": False,
        "old": (
            'exports.testExecProvider=async function testExecProvider(game,discovery){'
            'const exeName=discovery.executable||game.executable();'
            'if(void 0===discovery?.path||void 0===exeName)return Promise.resolve(!1);'
            'const exePath=path_1.default.join(discovery.path,exeName);'
            'try{await(0,fs_1.statAsync)(exePath);'
            'let _ev;try{_ev=exeVersion.default(exePath)}catch(e){_ev="0.0.0"}'
            'if("0.0.0"!==_ev)return Promise.resolve(!0);'
            'if("linux"===process.platform){'
            'const _lfs=require("fs");'
            'try{'
            'const _norm=s=>s.toLowerCase().replace(/[\\s.\\-_]/g,"");'
            'const _en=_norm(path_1.default.basename(exePath).replace(/\\.[^.]+$/,""));'
            'const _fls=_lfs.readdirSync(discovery.path).filter(f=>f.endsWith(".deps.json"));'
            'for(const _f of _fls){'
            'try{'
            'const _d=JSON.parse(_lfs.readFileSync(path_1.default.join(discovery.path,_f),"utf8"));'
            'for(const _lib of Object.keys(_d.libraries||{})){'
            'const _si=_lib.indexOf("/");if(_si<0)continue;'
            'const _lv=_lib.substring(_si+1);if(!_lv||"0.0.0"===_lv)continue;'
            'const _ln=_norm(_lib.substring(0,_si));'
            'if(_ln===_en||_ln.startsWith(_en)||_en.startsWith(_ln))return Promise.resolve(!0)'
            '}}catch(e){}}'
            '}catch(e){}}'
            'return Promise.resolve(!1)}'
            'catch(err){return(0,log_1.log)("error","unable to test executable version fields",err),Promise.resolve(!1)}}'
        ),
        "new": (
            'exports.testExecProvider=async function testExecProvider(game,discovery){'
            'const exeName=discovery.executable||game.executable();'
            'if(void 0===discovery?.path||void 0===exeName)return Promise.resolve(!1);'
            'const exePath=path_1.default.join(discovery.path,exeName);'
            'try{await(0,fs_1.statAsync)(exePath);'
            'let _ev;try{_ev=exeVersion.default(exePath)||"0.0.0"}catch(e){_ev="0.0.0"}'
            'if("0.0.0"!==_ev)return Promise.resolve(!0);'
            'if("linux"===process.platform){'
            'const _lfs=require("fs");'
            'try{'
            'const _norm=s=>s.toLowerCase().replace(/[\\s.\\-_]/g,"");'
            'const _en=_norm(path_1.default.basename(exePath).replace(/\\.[^.]+$/,""));'
            'const _fls=_lfs.readdirSync(discovery.path).filter(f=>f.endsWith(".deps.json"));'
            'for(const _f of _fls){'
            'try{'
            'const _d=JSON.parse(_lfs.readFileSync(path_1.default.join(discovery.path,_f),"utf8"));'
            'for(const _lib of Object.keys(_d.libraries||{})){'
            'const _si=_lib.indexOf("/");if(_si<0)continue;'
            'const _lv=_lib.substring(_si+1);if(!_lv||"0.0.0"===_lv)continue;'
            'const _ln=_norm(_lib.substring(0,_si));'
            'if(_ln===_en||_ln.startsWith(_en)||_en.startsWith(_ln))return Promise.resolve(!0)'
            '}}catch(e){}}'
            '}catch(e){}}'
            'return Promise.resolve(!1)}'
            'catch(err){return(0,log_1.log)("error","unable to test executable version fields",err),Promise.resolve(!1)}}'
        ),
    },
    {
        "name": "getExecGameVersion — v6→v7 migration: handle exeVersion returning undefined on Linux",
        "critical": False,
        "old": (
            'exports.getExecGameVersion=async function getExecGameVersion(game,discovery){'
            'const exePath=path_1.default.join(discovery.path,discovery.executable||game.executable());'
            'let _ver;try{_ver=exeVersion.default(exePath)}catch(err){_ver="0.0.0"}'
            'if("linux"===process.platform&&"0.0.0"===_ver){'
            'const _lfs=require("fs");'
            'try{'
            'const _norm=s=>s.toLowerCase().replace(/[\\s.\\-_]/g,"");'
            'const _en=_norm(path_1.default.basename(exePath).replace(/\\.[^.]+$/,""));'
            'const _fls=_lfs.readdirSync(discovery.path).filter(f=>f.endsWith(".deps.json"));'
            'let _best=null,_bsc=-1,_done=!1;'
            'for(const _f of _fls){'
            'if(_done)break;'
            'try{'
            'const _d=JSON.parse(_lfs.readFileSync(path_1.default.join(discovery.path,_f),"utf8"));'
            'for(const _lib of Object.keys(_d.libraries||{})){'
            'const _si=_lib.indexOf("/");if(_si<0)continue;'
            'const _lv=_lib.substring(_si+1);if(!_lv||"0.0.0"===_lv)continue;'
            'const _ln=_norm(_lib.substring(0,_si));'
            'const _sc=_ln===_en?2:_ln.startsWith(_en)||_en.startsWith(_ln)?1:0;'
            'if(_sc>_bsc){_bsc=_sc;_best=_lv}'
            'if(_bsc>=2){_done=!0;break}'
            '}}catch(e){}}'
            'if(_best&&_bsc>=1)_ver=_best'
            '}catch(e){}}'
            'return Promise.resolve(_ver)};'
        ),
        "new": (
            'exports.getExecGameVersion=async function getExecGameVersion(game,discovery){'
            'const exePath=path_1.default.join(discovery.path,discovery.executable||game.executable());'
            'let _ver;try{_ver=exeVersion.default(exePath)||"0.0.0"}catch(err){_ver="0.0.0"}'
            'if("linux"===process.platform&&"0.0.0"===_ver){'
            'const _lfs=require("fs");'
            'try{'
            'const _norm=s=>s.toLowerCase().replace(/[\\s.\\-_]/g,"");'
            'const _en=_norm(path_1.default.basename(exePath).replace(/\\.[^.]+$/,""));'
            'const _fls=_lfs.readdirSync(discovery.path).filter(f=>f.endsWith(".deps.json"));'
            'let _best=null,_bsc=-1,_done=!1;'
            'for(const _f of _fls){'
            'if(_done)break;'
            'try{'
            'const _d=JSON.parse(_lfs.readFileSync(path_1.default.join(discovery.path,_f),"utf8"));'
            'for(const _lib of Object.keys(_d.libraries||{})){'
            'const _si=_lib.indexOf("/");if(_si<0)continue;'
            'const _lv=_lib.substring(_si+1);if(!_lv||"0.0.0"===_lv)continue;'
            'const _ln=_norm(_lib.substring(0,_si));'
            'const _sc=_ln===_en?2:_ln.startsWith(_en)||_en.startsWith(_ln)?1:0;'
            'if(_sc>_bsc){_bsc=_sc;_best=_lv}'
            'if(_bsc>=2){_done=!0;break}'
            '}}catch(e){}}'
            'if(_best&&_bsc>=1)_ver=_best'
            '}catch(e){}}'
            'return Promise.resolve(_ver)};'
        ),
    },
]

WINAPI_PATCHES = [
    {
        "name": "winapi-bindings — silent no-op Proxy on Linux (avoid startup crash)",
        "old": "module.exports = {};",
        "new": (
            "module.exports=new Proxy({},{"
            "get:function(t,p){"
            "return function(){return undefined;};"
            "}});"
        ),
    },
]

# ── plugin patch definitions ───────────────────────────────────────────────

bp = Path(os.environ['_VORTEX_BP'])

PLUGIN_PATCHES = [
    # Bethesda games — redirect My Games INI path to Steam Proton prefix on Linux
    # Vortex uses getVortexPath("documents") which resolves to ~/Documents on Linux,
    # but Proton stores INIs inside the game's compatdata prefix instead.
    {
        "file": "gamebryo-test-settings/index.cjs",
        "replacements": [
            (
                'function mygamesPath(gameMode) {\n'
                '\treturn path.join(vortex_api.util.getVortexPath("documents"), "My Games", gameSupport.get(gameMode, "mygamesPath"));\n'
                '}',
                'function mygamesPath(gameMode) {\n'
                '\tif (process.platform === \'linux\') {\n'
                '\t\tconst _fs = require(\'fs\');\n'
                '\t\tconst _os = require(\'os\');\n'
                '\t\ttry {\n'
                '\t\t\tconst _disc = vortex_api.getState().persistent.gameMode.discovered;\n'
                '\t\t\tconst _discPath = _disc && _disc[gameMode] && _disc[gameMode].path;\n'
                '\t\t\tif (_discPath) {\n'
                '\t\t\t\tconst _normDisc = path.normalize(_discPath);\n'
                '\t\t\t\tconst _sr = path.join(_os.homedir(), \'.steam\', \'steam\');\n'
                '\t\t\t\tconst _libs = [path.join(_sr, \'steamapps\')];\n'
                '\t\t\t\ttry {\n'
                '\t\t\t\t\tconst _vdf = _fs.readFileSync(path.join(_sr, \'steamapps\', \'libraryfolders.vdf\'), \'utf8\');\n'
                '\t\t\t\t\tfor (const _m of _vdf.matchAll(/"path"\\s+"([^"]+)"/g)) _libs.push(path.join(_m[1], \'steamapps\'));\n'
                '\t\t\t\t} catch(_e) {}\n'
                '\t\t\t\tfor (const _lib of [...new Set(_libs)]) {\n'
                '\t\t\t\t\ttry {\n'
                '\t\t\t\t\t\tfor (const _mf of _fs.readdirSync(_lib).filter(f => f.startsWith(\'appmanifest_\') && f.endsWith(\'.acf\'))) {\n'
                '\t\t\t\t\t\t\ttry {\n'
                '\t\t\t\t\t\t\t\tconst _mt = _fs.readFileSync(path.join(_lib, _mf), \'utf8\');\n'
                '\t\t\t\t\t\t\t\tconst _im = _mt.match(/"installdir"\\s+"([^"]+)"/);\n'
                '\t\t\t\t\t\t\t\tif (_im && path.normalize(path.join(_lib, \'common\', _im[1])) === _normDisc) {\n'
                '\t\t\t\t\t\t\t\t\tconst _idm = _mf.match(/appmanifest_(\\d+)\\.acf/);\n'
                '\t\t\t\t\t\t\t\t\tif (_idm) {\n'
                '\t\t\t\t\t\t\t\t\t\tconst _dp = path.join(_lib, \'compatdata\', _idm[1], \'pfx\', \'drive_c\', \'users\', \'steamuser\', \'Documents\');\n'
                '\t\t\t\t\t\t\t\t\t\tif (_fs.existsSync(_dp)) return path.join(_dp, \'My Games\', gameSupport.get(gameMode, "mygamesPath"));\n'
                '\t\t\t\t\t\t\t\t\t}\n'
                '\t\t\t\t\t\t\t\t}\n'
                '\t\t\t\t\t\t\t} catch(_e) {}\n'
                '\t\t\t\t\t\t}\n'
                '\t\t\t\t\t} catch(_e) {}\n'
                '\t\t\t\t}\n'
                '\t\t\t}\n'
                '\t\t} catch(_e) {}\n'
                '\t}\n'
                '\treturn path.join(vortex_api.util.getVortexPath("documents"), "My Games", gameSupport.get(gameMode, "mygamesPath"));\n'
                '}',
            ),
        ],
    },
]

# ── apply plugin patches ───────────────────────────────────────────────────

print("Patching bundled plugins...")
for spec in PLUGIN_PATCHES:
    fpath = bp / spec['file']
    if not fpath.exists():
        print(f"  [SKIP] {spec['file']} (not found)")
        continue
    content = fpath.read_text('utf-8')
    changed = False
    for old, new in spec['replacements']:
        if old in content:
            content = content.replace(old, new)
            print(f"  [OK]   {spec['file']}: {old[:60]!r}")
            changed = True
        elif new not in content:
            print(f"  [WARN] {spec['file']}: pattern not found: {old[:60]!r}")
    if changed:
        fpath.write_text(content, 'utf-8')

# ── apply asar patches ─────────────────────────────────────────────────────

asar_path = Path(os.environ['_VORTEX_ASAR'])
print("\nPatching app.asar...")

raw = asar_path.read_bytes()
orig_size = len(raw)
header, _, dss = read_asar_header(raw)

# Navigate to winapi-bindings/index.js — patch it FIRST (higher offset → patch from end)
try:
    wi = header['files']['node_modules']['files']['winapi-bindings']['files']['index.js']
    print("  [winapi-bindings/index.js]")
    raw, dss = patch_asar_file(raw, header, dss, wi, WINAPI_PATCHES)
except (KeyError, TypeError):
    print("  [SKIP] winapi-bindings/index.js not found in asar")

# Reload header (dss may have changed after above patch)
header, _, dss = read_asar_header(raw)

# Patch renderer.js — lower offset, done second
if 'renderer.js' not in header.get('files', {}):
    print("ERROR: renderer.js not found in asar", file=sys.stderr)
    sys.exit(1)

ri = header['files']['renderer.js']
print("  [renderer.js]")
raw, dss = patch_asar_file(raw, header, dss, ri, RENDERER_PATCHES, marker=PATCH_MARKER)

asar_path.write_bytes(raw)
print(f"\napp.asar patched ({len(raw) - orig_size:+d} bytes total)")
