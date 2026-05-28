#include <stdio.h>
#include <string.h>

/* All-in-one Langman Database - 23 Languages */

static const char *asm_txt = "ASM (Assembly): The language of the CPU. Key concepts: Registers (EAX, ESP, EBP), Stack frames, Instruction pointer (EIP/RIP), Addressing modes (Immediate, Register, Memory). Operations: MOV (transfer), PUSH/POP (stack management), ADD/SUB (arithmetic), CMP (compare), JMP/JNE/JE (control flow). Learn: Intel syntax vs AT&T.";
static const char *cs_txt = "C#: A modern, object-oriented language. Key concepts: .NET Runtime, Garbage Collection, LINQ, Async/Await. Syntax: Strong typing, Properties, Generics. Usage: Enterprise apps, Game dev (Unity). Learn: 'using' statements, Lambda expressions, and Interfaces.";
static const char *el_txt = "Elisp: The heart of Emacs. Key concepts: S-expressions, Dynamic scope, Buffers, Keymaps. Syntax: defun, setq, let, if, cond. Usage: Emacs automation. Learn: Buffer manipulation (point, mark), Hook systems, and Interactive functions.";
static const char *html_txt = "HTML: The backbone of the web. Key concepts: Document structure (DOM), Tags, Attributes, Semantics. Syntax: <html>, <body>, <div>, <p>, <a>. Usage: Web page skeletons. Learn: SEO best practices, Forms/Validation, and Accessibility (ARIA).";
static const char *json_txt = "JSON: The language of data interchange. Key concepts: Objects {}, Arrays [], Key-Value pairs, Data types (string, number, bool, null). Syntax: Strict double quotes. Usage: APIs and Config. Learn: Schema validation and Parsing techniques.";
static const char *py_txt = "Python: Clean, readable, productive. Key concepts: Indentation, Dynamic typing, GIL. Syntax: def, class, if/else, list comprehensions. Usage: Scripting, AI, Web backends. Learn: PEP8, Decorators, Context managers, and Virtual environments.";
static const char *sh_txt = "Shell: The system operator. Key concepts: Pipes, Redirection, Globbing. Syntax: #!/bin/bash, Variables, if/then, while loops. Usage: Automation and Ops. Learn: Grep, Sed, Awk, and command substitution.";
static const char *toml_txt = "TOML: Config made human. Key concepts: Minimalistic, readable. Syntax: [section], key = value, arrays. Usage: Rust/Cargo config. Learn: Handling arrays of tables and inline tables.";
static const char *yaml_txt = "YAML: Data serialization. Key concepts: Indentation-based, nesting, comments. Syntax: key: value, - list item. Usage: CI/CD, K8s manifests. Learn: Anchors, Aliases, and block scalars.";
static const char *c_txt = "C: The mother of all systems languages. Key concepts: Pointers, Memory management (malloc/free), Structs, Preprocessor. Usage: OS kernels, Embedded systems. Learn: Pointer arithmetic, Function pointers, and Memory safety.";
static const char *css_txt = "CSS: Web styling. Key concepts: Box Model, Cascade, Specificity. Syntax: selector { property: value; }. Usage: Visuals. Learn: Flexbox, CSS Grid, Media queries, and Animations.";
static const char *go_txt = "Go: The cloud-native language. Key concepts: Goroutines (concurrency), Channels, Interfaces. Syntax: Static typing, packages. Usage: Microservices. Learn: Defer, Error handling pattern, and struct composition.";
static const char *java_txt = "Java: Portable OOP. Key concepts: JVM, Garbage Collection, Classpath. Syntax: Public class, Main method. Usage: Enterprise, Android. Learn: Streams API, Generics, and the Spring ecosystem.";
static const char *lua_txt = "Lua: Lightweight, embeddable. Key concepts: Tables are everything (data + structure), Metatables. Syntax: Local, functions, end. Usage: Game scripting (WoW, Roblox). Learn: Coroutines, Closures, and table-based OOP.";
static const char *r_txt = "R: Statistical power. Key concepts: Vectorization, Data frames. Syntax: <- assignment, f(x). Usage: Data science. Learn: tidyverse, ggplot2, and RStudio integration.";
static const char *ts_txt = "TypeScript: JavaScript with safety. Key concepts: Static typing, Interfaces, Generics, Compilation to JS. Syntax: var: type. Usage: Scalable front-end. Learn: Union types, Type narrowing, and Modules.";
static const char *cpp_txt = "C++: High performance. Key concepts: RAII, STL, Templates, OOP. Syntax: Classes, Smart Pointers. Usage: Games, Engines. Learn: Move semantics, Lambdas, and Template metaprogramming.";
static const char *d_txt = "D: The C++ successor. Key concepts: GC optional, Metaprogramming (CTFE), Modules. Syntax: C-like. Usage: Systems. Learn: Templates, Mixins, and SafeD.";
static const char *hs_txt = "Haskell: Pure functional logic. Key concepts: Immutability, Laziness, Monads, Typeclasses. Syntax: Type signatures. Usage: Research. Learn: Functors, Applicatives, and Higher-order functions.";
static const char *js_txt = "JavaScript: The web's lifeblood. Key concepts: Event-loop, Prototypes, Callbacks. Syntax: ES6+, arrow functions. Usage: Fullstack. Learn: Async/Await, Closures, and the DOM.";
static const char *rs_txt = "Rust: Memory safety without GC. Key concepts: Ownership, Borrowing, Lifetimes, Traits. Syntax: match, impl, pub. Usage: Systems. Learn: Macros, Cargo, and Error handling via Result/Option.";
static const char *swift_txt = "Swift: Apple's future. Key concepts: Protocols, Optionals, Safety. Syntax: var/let, closures. Usage: iOS/macOS. Learn: Structs vs Classes, Memory management (ARC).";
static const char *xml_txt = "XML: Hierarchical data. Key concepts: Tags, Attributes, Schema (XSD). Syntax: <tag>...</tag>. Usage: Enterprise legacy/SOAP. Learn: XPath, XSLT, and DOM parsing.";

typedef struct { const char *name; const char *text; } Lang;

static const Lang db[] = {
    {"asm", asm_txt}, {"cs", cs_txt}, {"el", el_txt}, {"html", html_txt},
    {"json", json_txt}, {"py", py_txt}, {"sh", sh_txt}, {"toml", toml_txt},
    {"yaml", yaml_txt}, {"c", c_txt}, {"css", css_txt}, {"go", go_txt},
    {"java", java_txt}, {"lua", lua_txt}, {"r", r_txt}, {"ts", ts_txt},
    {"cpp", cpp_txt}, {"d", d_txt}, {"hs", hs_txt}, {"js", js_txt},
    {"rust", rs_txt}, {"rs", rs_txt}, {"swift", swift_txt}, {"xml", xml_txt}
};

int main(int argc, char *argv[]) {
    if (argc < 2) { printf("Usage: langman <language>\n"); return 1; }
    int n = sizeof(db) / sizeof(Lang);
    for (int i = 0; i < n; i++) {
        if (strcmp(argv[1], db[i].name) == 0) {
            printf("%s\n", db[i].text);
            return 0;
        }
    }
    printf("Language '%s' not found.\n", argv[1]);
    return 1;
}
