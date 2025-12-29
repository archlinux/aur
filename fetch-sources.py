#!/usr/bin/env python3
import sys, os.path, logging, re, csv, zipfile, io, requests

NOREBO_ROOT = os.path.dirname(os.path.realpath(__file__))
FILE_LIST = list(csv.DictReader(open(os.path.join(NOREBO_ROOT, 'manifest.csv'))))


def download_files(upstream_dir):
    upstream_dir = os.path.realpath(upstream_dir)
    os.mkdir(upstream_dir)

    with requests.Session() as session:
        session.headers.update({'User-Agent': 'project-norebo/1.0'})
        for fi in FILE_LIST:
            resp = session.get(fi['url'])
            resp.raise_for_status()
            data = resp.content
            if fi['mode'] in ('text', 'source'):
                data = re.sub(b'\r?\n', b'\r', data)
                with open(os.path.join(upstream_dir, fi['filename']), 'wb') as f:
                    f.write(data)
            elif fi['mode'] == 'archive':
                fi['members'] = []
                with zipfile.ZipFile(io.BytesIO(data)) as zf:
                    for member in zf.infolist():
                        fn = os.path.basename(member.filename)
                        if not fn.endswith('.txt'):
                            with open(os.path.join(upstream_dir, fn), 'wb') as f:
                                f.write(zf.read(member))
                            fi['members'].append(fn)


def main():
    logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.INFO)
    if len(sys.argv) != 2 or os.path.exists(sys.argv[1]):
        logging.error("Usage: %s UPSTREAM_DIR", __file__)
        logging.error("  (UPSTREAM_DIR must not already exist.)")
        sys.exit(1)
    download_files(sys.argv[1])


if __name__ == '__main__':
    main()
