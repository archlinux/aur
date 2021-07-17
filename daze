#!/usr/bin/env python
import sys
import os
#!/usr/bin/env python
def toHtml(input):
  top=input.split("$content")[0]
  head=top.split("$meta")[0].strip('$variables')
  meta=top.split("$meta")[1]
  body=input.split("$content")[1]
  meta=meta.strip("\n").split("!")
  for i in range(len(meta)):
      meta[i]=meta[i].strip("\n")
  meta.pop(0)
  metaValues={}
  for i in range(len(meta)):
      metaValues[meta[i].split("=")[0]]=meta[i].split("=")[1]
  metahtml=""
  for i in range(len(metaValues)):
      if list(metaValues)[i]=="title":
          metahtml=metahtml+f'<title>{metaValues[list(metaValues)[i]][1:-1]}</title>\n'
      else:
          metahtml=metahtml+f'<meta name="{metaValues.keys[i][1:-1]}" content="{metaValues[i][1:-1]}">\n'
  head=head.strip("\n").split("!")
  for i in range(len(head)):
      head[i]=head[i].strip("\n")
  head.pop(0)
  variables={}
  for i in range(len(head)):
      variables[head[i].split("=")[0]]=head[i].split("=")[1]
  body=body.strip("\n").split("(")
  body.pop(0)
  bodyhtml=""
  for i in range(len(body)):
      part=body[i].split(")")
      element=part[0].strip(" ").split(": ")
      contents=element[1]
      for i in variables.keys():
        if variables[i][0]=="'"or variables[i][0]=='"':
          contents=contents.replace(f"!{i}",variables[i][1:-1])
        else:
          contents=contents.replace(f"!{i}",variables[i])
      attributes_unprocessed=part[1].strip("\n").split("+")
      attributes={}
      for i in range(len(attributes_unprocessed)):
        attributes_unprocessed[i]=attributes_unprocessed[i].strip("\n")
      attributes_unprocessed.pop(0)
      for i in range(len(attributes_unprocessed)):
        attributes[attributes_unprocessed[i].split("=")[0]]=attributes_unprocessed[i].split("=")[1]
      strAttributes=""
      for i in attributes.keys():
          strAttributes=strAttributes+f' {i}="{attributes[i][1:-1]}"'
      bodyhtml=bodyhtml+f'<{element[0]}{strAttributes}>{contents}</{element[0]}>\n'
  return(f"""<!DOCTYPE html>
<html>

<!-- Site compiled from Daze -->

<head>

{metahtml}
</head>
<body>
{bodyhtml}
</body>
</html>""")

if len(sys.argv)>=2:
    if sys.argv[1]=="compile":
        if len(sys.argv)==4:
            inFile = sys.argv[2]
            outFile = sys.argv[3]
            with open(inFile,'r') as i:
                lines = i.read()
                with open(outFile,'w') as o:
                    o.write(toHtml(lines))
        elif len(sys.argv)>4:
            print("daze: Too many arguments")
        elif len(sys.argv)==3:
            print("daze: No output file specified")
        elif len(sys.argv)==2:
            print("daze: No input file specified")
        else:
            print("daze: Internal Error 0x01")
    elif sys.argv[1]=="help":
        print("""
        Daze: A declarative programing language

        compile: Compiles the input file into an html file (daze compile <input> <output>)
        help: Shows this help message
        """)
    else:
        print(f"daze: invalid command {sys.argv[1]}. Try 'daze help' to see available commands.")
else:
    print("daze: no command. Try 'daze help' to see available commands.")
