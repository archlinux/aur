
# pygradientify

make terminal UI'S beautiful.



## Installation

Install my-project with npm

```bash
pip install pygradientify

pacman -S python-pygradientify
```
    
## Usage / examples

```python
from pygradientify import Colors

"""
normal print
"""
print(Colors.red_to_blue("Hello World!"))
print(Colors.mystic("Hello World!"))

"""
ascii art print
"""
art = """
╔═╗╦ ╦╔═╗╦═╗╔═╗╔╦╗╦╔═╗╔╗╔╔╦╗╦╔═╗╦ ╦
╠═╝╚╦╝║ ╦╠╦╝╠═╣ ║║║║╣ ║║║ ║ ║╠╣ ╚╦╝
╩   ╩ ╚═╝╩╚═╩ ╩═╩╝╩╚═╝╝╚╝ ╩ ╩╚   ╩ 
"""

print(Colors.blue_to_cyan(art))
print(Colors.purple_to_white(art))
print(Colors.orange_to_pink(art))

"""
all colors.
"""
for gradients in Colors.colors:
    grad = getattr(Colors, gradients)
    print(grad(f"{gradients}: The quick brown fox jumps over the lazy dog"))
```