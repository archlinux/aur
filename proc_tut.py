import markdown
from markdown.preprocessors import Preprocessor
from markdown.postprocessors import Postprocessor
from markdown.extensions import Extension
import sys
import re
import os
import codecs
import jinja2

'''
Process Github Wiki Tutorial Pages
Simon Wilper
2017-02-24
'''

class BrokenLinkPreprocessor(Preprocessor):
    '''
    Github Wiki inserts a space between link title and url what breaks
    python's markdown processor. This Preprocessor fixes this
    '''
    def run(self,lines):
        new_lines = []
        for line in lines:
            new_lines.append(re.sub(r"\] \(", '](', line))
        return new_lines

class MkLocalLinkPostprocessor(Postprocessor):
    '''
    In order to make interlinks work, add a .html suffix in all hrefs
    but no the ones beginning with https?
    '''
    def run(self,text):
        new_text=re.sub(
                r'href="(?!https?://)(.+?)"',
                r'href="\1.html"',
                text
                )
        return new_text

class FixGHLinksExtension(Extension):
    def extendMarkdown(self, md, md_globals):
        md.preprocessors.add( 'blpp', BrokenLinkPreprocessor(),
                '_begin' )
        md.postprocessors.add( 'llpp', MkLocalLinkPostprocessor(),
                '_begin' )

if len(sys.argv) < 3:
    print('Give markdown source file and html output file')
    sys.exit(-1)

file_name = sys.argv[1]
output_file_name = sys.argv[2]

input_file = codecs.open(file_name, mode="r", encoding="utf-8")
md_text = input_file.read()
html = markdown.markdown(md_text, extensions=[
    FixGHLinksExtension(),
    'markdown.extensions.codehilite',
    'markdown.extensions.fenced_code'
    ])

t = jinja2.Environment(
        loader=jinja2.FileSystemLoader(
                os.path.dirname(os.path.realpath(__file__))
            )
    ).get_template('default.html')

output_file = codecs.open(
        output_file_name, "w", encoding="utf-8",
        errors="xmlcharrefreplace"
    )

output_file.write(t.render(title=file_name,contents=html))
