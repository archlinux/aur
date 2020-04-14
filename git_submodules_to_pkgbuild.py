# use this script to translate a .gitmodules file into instructions that fit into
# a PKGBUILD
#!/usr/bin/python
import re
import sys

def main():
    p0 = re.compile("\[submodule (.*)\]")
    p1 = re.compile("url = (.*)")
    strs = list(open(sys.argv[1]))
    module_names = []
    urls = []
    state = [False, False]
    while len(strs) > 0:
        s = strs.pop(0)
        s = s.lstrip()
        
        r = p0.match(s)
        if r:
            if state[0]:
                # got a new list entry - the old one is saved already
                state = [False, False]
            module_name = r.groups()[0]
            module_names.append(module_name)
            state[0] = True
            continue

        r = p1.match(s)
        if r:
            if state[1]:
                print("already got url - skipping")
            else:
                url = r.groups()[0]
                urls.append(url)
            state[1] = True
            continue
        
        # could not parse line - skip silently

    # build output file
    source_str = "source=("
    for url in urls:
        source_str = source_str + "    " + "\"git+" + url + "\"\n"
    
    source_str = source_str + ")\n"
    
    md5_str = "md5sums=("
    for _ in module_names:
        md5_str = md5_str + "   'SKIP'\n"
    md5_str = md5_str + ")\n"
    
    # get the local name of the clone (group 7)
    # taken from https://stackoverflow.com/questions/2514859/regular-expression-for-git-repository and adapted
    p = re.compile("((git@|http(s)?:\/\/)([\w\.@]+)(\/|:*))([\w,\-,\_]*)\/([\w,\-,\_]+)(.git){0,1}((\/){0,1})")
    prepare_str = "prepare() {"
    for (name,url) in zip(module_names, urls):
        print(url)
        local_name = p.match(url).groups()[6]
        print(local_name)
        prepare_str = prepare_str + "     git config submodule." + name + ".url " + "\"${srcdir}/" + local_name + "\"\n"
        
    prepare_str = prepare_str + "}\n"
    
    print(source_str)
    print(md5_str)
    print(prepare_str)
    

if __name__=="__main__":
    main()
