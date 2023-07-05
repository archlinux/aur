import re, subprocess
import requests
from bs4 import BeautifulSoup as Soup

def get_our_last():
    with open('last_successful_commit.txt') as last_file:
        return last_file.read()

def get_their_last():
    url = 'http://ml-ci.amd.com:21096/job/tensorflow/job/release-rocmfork-r212-rocm-enhanced/job/release-build-whl/lastSuccessfulBuild/'
    page = requests.get(url)
    s = Soup(page.content.decode('utf-8'), features="lxml")
    strong_tags = s.find_all('strong')
    _, their_last = [tag for tag in strong_tags if tag.string != 'Repository']
    their_last = str(their_last.next_sibling)
    return their_last.lstrip(': ').rstrip('\t\n')

def get_pkgrel(lines):
    expression = re.compile('pkgrel=(\d+)')
    m = expression.match(lines[16])
    assert(not m is None)
    n ,= m.groups()
    return int(n)

def main():
    our_last = get_our_last()
    their_last = get_their_last()
    if our_last == their_last:
        print('We\'re up to date; no worries.')
        return
    
    print('New last successful build:', their_last)
    with open('PKGBUILD') as pkgbuild_file:
        lines = pkgbuild_file.readlines()
    assert(lines[12] == '_known_good_commit=%s\n' % our_last)
    n = get_pkgrel(lines)
    lines[12] = '_known_good_commit=%s\n' % their_last
    lines[16] = 'pkgrel=%d\n' % (n + 1)
    
    with open('PKGBUILD', 'w') as pkgbuild_file:
        pkgbuild_file.write(''.join(lines))
    
    with open('last_successful_commit.txt', 'w') as last_file:
        last_file.write(their_last)
    
    print('PKGBUILD has been updated. Updating .SRCINFO...')
    subprocess.run(['makepkg', '--printsrcinfo'], stdout=open('.SRCINFO', 'wb'))
    
    print('Please build and test before pushing.')

if __name__ == '__main__':
    main()
