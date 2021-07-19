#!/usr/bin/env python
import sys
import os
def split(delimiters, string, maxsplit=0):
    import re
    regexPattern = '|'.join(map(re.escape, delimiters))
    return re.split(regexPattern, string, maxsplit)

def toHtml(input, outputPart="full"):
  head=input.split("$content")[0]
  body=input.split("$content")[1]
  head=split(["+!","+%","##"], head.strip("\n").replace("+%","+%~mv").replace("+!", "+!~v").replace("##","##~c"))
  for i in range(len(head)):
      head[i]=head[i].strip("\n")
  head.pop(0)
  variables={}
  metaVariables={}
  for i in range(len(head)):
    if head[i][0]=="~" and head[i][1]=="v":
      variables[head[i].split("=")[0][2::]]=head[i].split("=")[1]
    elif head[i][0]=="~" and head[i][1]=="m" and head[i][2]=="v":
      metaVariables[head[i].split("=")[0][3::]]=head[i].split("=")[1]
    elif head[i][0]=="~" and head[i][1]=="c":
      print(f"Comment at line {i+2}: '{head[i][2::]}'")
    else:
      print(f"!! Daze Syntax Error: Invalid Character in $variables at line {i+2}")
  metahtml=""
  for i in list(variables):
    contents=variables[i]
    for j in variables.keys():
      if variables[j][0]=="'"or variables[j][0]=='"':
        contents=contents.replace(f"!{j} ",variables[j][1:-1])
      else:
        contents=contents.replace(f"!{j} ",variables[j])
    variables[i]=contents
  for i in list(metaVariables):
    contents=metaVariables[i]
    for j in metaVariables.keys():
      if metaVariables[j][0]=="'"or metaVariables[j][0]=='"':
        contents=contents.replace(f"%{j} ",metaVariables[j][1:-1])
      else:
        contents=contents.replace(f"%{j} ",metaVariables[j])
    metaVariables[i]=contents
  for i in list(metaVariables):
    contents=metaVariables[i]
    for j in variables.keys():
      if variables[j][0]=="'"or variables[j][0]=='"':
        contents=contents.replace(f"!{j} ",variables[j][1:-1])
      else:
        contents=contents.replace(f"!{j} ",variables[j])
    metaVariables[i]=contents
  for i in range(len(metaVariables)):
      if list(metaVariables)[i]=="title":
          metahtml=metahtml+f'<title>{metaVariables[list(metaVariables)[i]][1:-1]}</title>\n'
      else:
          metahtml=metahtml+f'<meta name="{list(metaVariables)[i][1:-1]}" content="{metaVariables[i][1:-1]}">\n'
  
  body=body.strip("\n").split("(")
  body.pop(0)
  bodyhtml=""
  for i in range(len(body)):
      part=body[i].split(")")
      element=part[0].strip(" ").split(": ")
      contents=element[1]
      if contents[0]=='"' and contents[-1]=='"' or contents[0]=="'" and contents[-1]=="'":
          contents=contents[1:-1]
      for i in variables.keys():
        if variables[i][0]=="'"or variables[i][0]=='"':
          contents=contents.replace(f"!{i} ",variables[i][1:-1])
        else:
          contents=contents.replace(f"!{i} ",variables[i])
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
      if element[0]=="img":
        bodyhtml=bodyhtml+f'<img src="{contents}" {strAttributes}>\n'
      elif element[0]=="linkScript":
        bodyhtml=bodyhtml+f'<script src="{contents}" {strAttributes}></script>\n'
      elif element[0]=="linkStyle":
        bodyhtml=bodyhtml+f'<link rel="stylesheet" href="{contents}" {strAttributes}>\n'
      elif element[0]=="link":
        bodyhtml=bodyhtml+f'<link href="{contents}" {strAttributes}>\n'
      elif element[0]=="script":
        bodyhtml=bodyhtml+f'<script {strAttributes}>\n{contents}\n</script>\n'
      elif element[0]=="style":
        bodyhtml=bodyhtml+f'<style {strAttributes}>\n{contents}\n</style>\n'
      else:
        bodyhtml=bodyhtml+f'<{element[0]}{strAttributes}>{contents}</{element[0]}>\n'
  if outputPart=="full":
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
  elif outputPart=="head":
      return(f"""<!-- Part compiled from Daze -->
{metahtml}
<!-- End of Part -->
""")
  elif outputPart=="body":
      return(f"""<body>
<!-- Part compiled from Daze -->
{bodyhtml}
<!-- End of Part -->
""")

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
