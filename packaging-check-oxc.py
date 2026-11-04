"""Retained OXC source tests and real Studio calls against installed payloads."""
from pathlib import Path
from importlib.metadata import distribution
import argparse, hashlib, json, os, subprocess, tarfile
p=argparse.ArgumentParser()
p.add_argument('--output',type=Path,required=True)
p.add_argument('--prefix',type=Path,default=Path('/usr'))
p.add_argument('--source-root',type=Path)
args=p.parse_args()
a=args.output.resolve();a.mkdir(parents=True,exist_ok=False)
prefix=args.prefix.resolve()
dist=distribution('unsloth')
project=Path(dist.locate_file('')).resolve()
assert project.is_relative_to(prefix)
tool=project/'studio/backend/core/data_recipe/oxc-validator'
assert tool.is_dir()
sha=lambda p:hashlib.file_digest(Path(p).open('rb'),'sha256').hexdigest()
original_scripts={'validate.mjs':'9da5e49a0d2adc4a9005f9a4fc1b23c53d3fc125d897c0006016e445be05336a','compile-react.mjs':'416c577c8a82c50af04dadff158015f9d59403ea9349e97a81c3d4c4901b6c08'}
for name,digest in original_scripts.items():assert sha(tool/name)==digest
native=sorted((tool/'node_modules').rglob('*.node'));assert len(native)==3
native_before={str(x.relative_to(project)):sha(x) for x in native}
assert (tool/'node_modules/.bin/oxlint').is_symlink()
assert (tool/'node_modules/.bin/oxlint').resolve()==(tool/'node_modules/oxlint/bin/oxlint').resolve()
env=dict(os.environ)
env.pop('NODE_PATH',None)
report={'status':'RUNNING','commands':[],'workflows':[],'native':native_before}
def save():
 (a/'result.json').write_text(json.dumps(report,indent=2)+'\n')
def run(command,cwd,label,env=None,payload=None,timeout=1200):
 result=subprocess.run(command,cwd=cwd,env=env,input=payload,text=True,capture_output=True,timeout=timeout)
 for suffix,text in [('stdout',result.stdout),('stderr',result.stderr)]:
  (a/(label+'.'+suffix)).write_text(text)
 report['commands'].append({'label':label,'returncode':result.returncode,'stdout_sha256':sha(a/(label+'.stdout')),'stderr_sha256':sha(a/(label+'.stderr'))})
 save();result.check_returncode();return result.stdout
good = 'export const square = (x) => x * x;'
bad = 'export const broken = ;'
lint_bad = 'export const result = (value) => value === NaN;'
for mode, codes in [('syntax', [good, bad]), ('lint', [good, lint_bad]),
                    ('syntax+lint', [good, bad, lint_bad])]:
    payload = {'codes': codes, 'lang': 'js', 'mode': mode, 'code_shape': 'module', 'timeout_ms': 30000}
    answer = json.loads(run(['node', str(tool / 'validate.mjs')], tool,
                            'validate-' + mode.replace('+', '-'), env,
                            payload=json.dumps(payload), timeout=45))
    assert len(answer) == len(codes)
    assert answer[0]['is_valid'] is True and answer[0]['error_count'] == 0
    for code, row in zip(codes[1:], answer[1:]):
        if code == bad:
            assert row['is_valid'] is False and row['error_count'] > 0
        else:
            # Upstream deliberately treats lint warnings as valid. Require the
            # actual NaN rule diagnostic, not a missing-launcher fallback.
            assert row['is_valid'] == (row['error_count'] == 0)
            assert 'nan' in row['error_message'].lower()
        assert row['error_count'] + row['warning_count'] > 0
        message = row.get('error_message', '')
        assert message and not any(x in message.lower() for x in
                                   ['could not', 'enoent', 'timed out', 'failed to run', 'unavailable'])
    report['workflows'].append({'name': 'validate-' + mode, 'input': payload, 'result': answer})
    save()
serve_payload = '\n'.join(json.dumps({'id': i, 'payload': {'codes': [code], 'lang': 'js',
                          'mode': 'syntax', 'code_shape': 'module'}})
                          for i, code in enumerate([good, bad], 1)) + '\n'
served = [json.loads(line) for line in run(['node', str(tool / 'validate.mjs'), '--serve'],
          tool, 'validate-serve', env, payload=serve_payload, timeout=45).splitlines()]
assert [row['id'] for row in served] == [1, 2]
assert [row['result'][0]['is_valid'] for row in served] == [True, False]
report['workflows'].append({'name': 'validate-serve', 'result': served})
for name, source, lang in [
        ('jsx-good', 'export default function Demo(){return <div>Hello</div>;}', 'jsx'),
        ('tsx-good', 'export default function Demo(){const n:number=2;return <div>{n}</div>;}', 'tsx'),
        ('jsx-bad', 'export default function Demo(){return <div>;} ', 'jsx')]:
    payload = {'source': source, 'lang': lang}
    answer = json.loads(run(['node', str(tool / 'compile-react.mjs')], tool,
                            name, env, payload=json.dumps(payload), timeout=45))
    if name.endswith('good'):
        assert answer['status'] == 'ok' and answer['code']
        assert '<div>' not in answer['code'] and 'react/jsx-runtime' in answer['deps']
    else:
        assert answer['status'] == 'error' and answer['diagnostics']
    report['workflows'].append({'name': name, 'input': payload, 'result': answer})
    save()


if args.source_root is not None:
    w=args.source_root.resolve()
    manifest=json.loads((w/'oxc-sources.json').read_text())
    env.update(COREPACK_HOME=str(w/'oxc-corepack-cache'),COREPACK_ENABLE_DOWNLOAD_PROMPT='0',CARGO_HOME=str(w/'oxc-cargo-cache'),CARGO_TARGET_DIR=str(w/'oxc-cargo-target'),npm_config_store_dir=str(w/'oxc-pnpm-store'),GIT_CEILING_DIRECTORIES=str(w),CI='1')
    env['PATH']=str(w/'oxc-tool-bin')+os.pathsep+env['PATH']
    # The original selected test files and expected snapshot files are unmodified.
    for package in manifest['packages']:
        if not package['test_files']:
            continue
        source = manifest['sources'][package['source_index']]
        package_root = w / source['archive_prefix'] / package['path']
        originals = {}
        with tarfile.open(w / source['filename']) as tar:
            for member in tar:
                prefix = source['archive_prefix'] + '/' + package['path'] + '/test/'
                if member.isfile() and member.name.startswith(prefix):
                    relative = member.name[len(source['archive_prefix']) + 1:]
                    original = hashlib.sha256(tar.extractfile(member).read()).hexdigest()
                    assert sha(w / source['archive_prefix'] / relative) == original
                    originals[relative] = original
        assert originals
        run(['corepack', 'pnpm', 'exec', 'vitest', 'run', *package['test_files'],
             '--reporter=default', '--reporter=junit', '--outputFile=' + str(a / (package['name'] + '-tests.xml'))],
            package_root, package['name'] + '-tests', env)
        for relative, digest in originals.items():
            assert sha(w / source['archive_prefix'] / relative) == digest
        report.setdefault('upstream_test_sources', {})[package['name']] = originals
        save()

for name,digest in original_scripts.items():assert sha(tool/name)==digest
assert {str(x.relative_to(project)):sha(x) for x in native}==native_before
report['status']='INSTALLED_STUDIO_OXC_VALIDATOR_AND_REACT_PASS'
report['upstream_suite']='FIVE_EXACT_SOURCE_MODULES' if args.source_root else 'SEPARATE_BUILD_PROOF'
save()
print('PASS: installed Studio native validator and React compilation workflow')
