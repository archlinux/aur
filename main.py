#!/usr/bin/env python
# The original code is at https://github.com/aderepas/langfetch

from json import load
from subprocess import run
import logging


class log(logging.Formatter):
    grey = "\x1b[38;20m"
    yellow = "\x1b[38;5;214m"
    red = "\x1b[31;20m"
    bold_red = "\x1b[31;1m"
    reset = "\x1b[0m"
    format = "%(asctime)s - %(name)s - %(levelname)s - %(message)s (%(filename)s:%(lineno)d)"

    FORMATS = {
        logging.DEBUG: f"{grey} {format} {reset}",
        logging.INFO: f"{grey} {format} {reset}",
        logging.WARNING: f"{yellow} {format} {reset}",
        logging.ERROR: f"{red} {format} {reset}",
        logging.CRITICAL: f"{bold_red} {format} {reset}"
    }

    def format(self, record):
        log_fmt = self.FORMATS.get(record.levelno)
        formatter = logging.Formatter(log_fmt)
        return formatter.format(record)


# create logger with 'spam_application'
logger = logging.getLogger("lang_fetch")
logger.setLevel(logging.DEBUG)

# create console handler with a higher log level
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)

ch.setFormatter(log())

logger.addHandler(ch)
from re import search
sub = {
    "gcc": "c",
    "clang": "c",
    "g++": "c++",
    "clang++": "c++",
    "ghc": "haskell"
}


def get_ascii_art(lang: str) -> str:
    lang = lang.lower()

    lang = sub.get(lang, lang)

    match lang:
        case "ada":
            return """                      ,+
$1                     .:S
$1  .                  +:@:
$1 .S                  ;S*#:
$1  #*                 +%S%@S:
$1  ;@?.     .,,:::::;%#@SSS#@%.
$1   ;#@?;,   .:;+++;%@@$2%##S%$1S#%
$1   +:*#@@@##@@@@@@@$2@?###$3#%$2%##$1#.
$1   .?%++*?SS#SSSS#@$2S@@$3@*##@$2S@$1S
$1     ,*#@#S%S#@@@#S%S$2#@$3#S@@$2S@$1+
$1       :*??%%%%SSSS%%###$2#$3SS$2#$1#:
$1        .;*?%SS%?%**. ,+%@#??
$1                       .:%SS+
$1                 .+*?%%##SSS.
$1               .*??S###SS#%.
$1                 ,+%SSS%+,      """
        case "apl":
            return """        +@@@@#
$1         ,S@@S
$1      ..   +@?    :++ ####%*,
$1  :?#@@@@S.,:,.;%@@@%.@@@@@@@?.
$1 ?@@@@@@@@,*@#@@@@@@%.@@@@@@@@S.
$1+@@@@@@@@@,?@@@@@@@@%.@@@@@@@@@?
$1;;;;;;;;;;.,;;;;;;;;: ;;;;;;;;;;
$1@@@@S*#@@@,?@?*???%@%.@S?*?#@@@@
$1@@@#:;,#@@,?@# *@? %%.@@? #@@@@@
$1S@@:*?,:@@,?@# ;%%S@%.@@? #@@*@S
$1;#++#@*:+#,?@?:+S@@@%.@#+:??*+@+
$1 +++++++++.:++++++++; +++++++++
$1 .%#######,*########? #######S.
$1  .%@@@@@@,?@@@@@@@@%.@@@@@@S.
$1    ;#@@@@,?@@@@@@@@%.@@@@#+
$1      :?S@,?@#%*?%#@% #S?:      """
        case "bqn":
            return """%%?,                         :++
@@@@?,        ....           *@@
@@%%@@?,   ;#@@@@@@#%+,      *@@
@@? ,%@@?,  +;:,,:;*%@@S+    *@@
@@?  ,#@#*:::::::::::;*#@S,  *@@
@@? :@@%.+@@@@@@@@@@@@+.%@@: *@@
@@? #@S  +@@:......:@@+  S@# *@@
@@?:@@+  +@@%?????%@@%,  +@@:*@@
@@*:@@+  +@@%%%%%%%@@%,  +@@:*@@
@@* #@S  +@@,......:@@+  S@# *@@
@@* :@@%.+@@@@@@@@@@@@+.%@@: *@@
@@*  :#@#*;:::::::::::*#@#:  *@@
@@*    +#@@%+;,,,,;+  ,%@@?, *@@
@@*      :*%#@@@@@@#;   ,%@@?%@@
@@*           .,,.        ,%@@@@
**:                         ,?SS
                                """
        case "c++":
            return """            .;?##%+,
         :*S@@@@@@@@#*:.
     .+%#@@@@#S%%S#@@@@@%+,
  :*S@@@@#*:.       ,+S@@@@$2#?;$1
 ;@@@@@#;              :S@$2@@@@*$1
 ;@@@@%.     :*??*;.   $2,+@@@@@*$1
 ;@@@#.    ;#@@@@@@@$2*?#@*@@@*@*$1
 ;@@@?    .@@@@$2@@@@@@@@* *@* **$1
 ;@@@*    ,@@@$3@$2@@@@@@@@, ,@, ,*$1
 ;@@@#.    ;$3#@@@@@@@$2??#@,@@@,@*$1
 ;@@@@%   $3  .;*%%?+.  $2 ,+#@@@@*$1
 ;@@@@$3@S:            $3  ,%@@$2@@@*$1
  $3;?#@@@@S+,        ,+%@@@@#?;.
     $3,+%@@@@@S%%%%S#@@@@S*:
       $3  :*S@@@@@@@@#?;.
         $3   .+%#@%+,            """
        case "c":
            return """            .;?##%+,
         :*S@@@@@@@@#*:.
     .+%#@@@@#S%%S#@@@@@%+,
  :*S@@@@#*:.       ,+S@@@@$2#?;$1
 ;@@@@@#;              :S@$2@@@@*$1
 ;@@@@%.     :*??*;.   $2,+@@@@@*$1
 ;@@@#.    ;#@@@@@@@$2*?#@@@@@@@*$1
 ;@@@?    .@@@@$2@@@@@@@@@@@@@@@*$1
 ;@@@*    ,@@@$3@$2@@@@@@@@@@@@@@@*$1
 ;@@@#.    ;$3#@@@@@@@$2??#@@@@@@@*$1
 ;@@@@%   $3  .;*%%?+.  $2 ,+#@@@@*$1
 ;@@@@$3@S:            $3  ,%@@$2@@@*$1
  $3;?#@@@@S+,        ,+%@@@@#?;.
     $3,+%@@@@@S%%%%S#@@@@S*:
       $3  :*S@@@@@@@@#?;.
         $3   .+%#@%+,            """
        case "clojure":
            return """        $3.:+?S##@@##S?+:.
     $3.+%@@@@@@@@@@@@@@@@%;.
   $3.*SS%S#@@@@@@@@@@@@@@@@#*.
   ,     $4 .::,,,,,,:$3*S@@@@@@#:
   $1;?S##*$4 ,; ,S@@@@S*,,$3?@@@@@@;
$1 ;#@@@@$2:.%@@#,$4.S@@@@@@?.$3;@@@@@@,
$1+@@@@@;$2.S@@@@#,$4,@@@@@@@S $3+@@@@@?
$1@@@@@@$2 +@@@@@@? $4*@@@@@@@; $3@@@@@#
$1#@@@@@$2 +@@@@@%,+.$4#@@@@@@; $3@@@@@#
$1%@@@@@;$2.#@@@?.S@,,$4#@@@@S $3+@@@@@*
$1,@@@@@@:$2.%@% ?@@S $4,#@@%.$3;@@@@#+
$1 ;@@@@@@?,$2,. @@@@%..$3;, :??*+:
$1  :#@@@@@@%+:,,:,,,:+;:,,,,::
$1   .*@@@@@@@@@@@@@@@@@@@@@#*.
$1     .+S@@@@@@@@@@@@@@@@%+.
$1        .:*?S#@@@@#S?*:.        """
        case "crystal":
            return """         .+##S%*;:.
       .*#@@@@@@@@@@S%*+:,
     .*#@@@@@@@@@@@@@@@@@@@#.
    +#@@@@@@@@@@@@@@@@@@@@@@+
  +#@@@@@#%?+;,.S@@@@@@@@@@@#.
+SS%*+:,       +@@@@@@@@@@@@@*
%%,            #@@@@@@@@@@@@@@,
,@@%,         +@@@@@@@@@@@@@@@%
 ?@@@%,      .#@@@@@@@@@@@@@@@@:
 ,@@@@@%,    *@@@@@@@@@@@@@@@@@%
  ?@@@@@@%, .@@@@@@@@@@@@@@@@@#+
  .@@@@@@@@%%@@@@@@@@@@@@@@@#+.
   *@@@@@@@@@@@@@@@@@@@@@@#+.
   .#@@@@@@@@@@@@@@@@@@@#+.
     .,;+?%#@@@@@@@@@@#+.
             ,:+*?S##+.
                   .;           """
        case "c#":
            return """            .;?##%+,
         :*S@@@@@@@@#*:.
     .+%#@@@@#S%%S#@@@@@%+,
  :*S@@@@#*:.       ,+S@@@@$2#?;$1
 ;@@@@@#;              :S@$2@@@@*$1
 ;@@@@%.     :*??*;.   $2,+@@@@@*$1
 ;@@@#.    ;#@@@@@@@$2*?#@@*@*@@*$1
 ;@@@?    .@@@@$2@@@@@@@@@*   *@*$1
 ;@@@*    ,@@@$3@$2@@@@@@@@@,   ,@*$1
 ;@@@#.    ;$3#@@@@@@@$2??@@@,@,@@*$1
 ;@@@@%   $3  .;*%%?+.  $2 ,+#@@@@*$1
 ;@@@@$3@S:            $3  ,%@@$2@@@*$1
  $3;?#@@@@S+,        ,+%@@@@#?;.
     $3,+%@@@@@S%%%%S#@@@@S*:
       $3  :*S@@@@@@@@#?;.
         $3   .+%#@%+,            """
        case "d":
            return """:;;;;;;;;:::::,             .*%;
#@@@@@@@@@@@@@@@S*: .+?#?+, :#@?
#@@@@??????%%#@@@@@@@@@@@@@#;
#@@@@         .;%@@@@@@@@@@@@,
#@@@#            ;@@@@@@@@@@@:
#@@@#             %@@@@@@@@@+
#@@@#             %@@@@#%*;.
#@@@@            +@@@@#.
#@@@@         .;%@@@@#,
#@@@@*****??%#@@@@@#*.
#@@@@@@@@@@@@@@@S*:
;+++++++++;;;:,.    """
        case "dart":
            return """$3              ,+%S?:
           ,+%SSSSSS?:
        :+%SSSSSSSSSSS?$1
      ;%%%%%%%%%%%%%%%%$2*+,
$1    .*%$3SS$1%%%%%%%%%%%%%%%$2#@S;
$1   ,?%%$3SSSS$1%%%%%%%%%%%%%%$2@@@#;
$1  ;%%%%$3SSSSSS$1%%%%%%%%%%%%$2S@@@@#;
$1.*%%%%%$3SSSSSSSS$1%%%%%%%%%%%$2#@@@@@
$1?%%%%%%$3SSSSSSSSSS$1%%%%%%%%%%$2#@@@@
$1,*%%%%%$3SSSSSSSSSSSS$1%%%%%%%%%$2@@@@
$1  ,*%%%$3SSSSSSSSSSSSSS$1%%%%%%%$2S@@@
$1    ,;+$3SSSSSSSSSSSSSSSS$1%%%%%%$2#@@
$4       +@@$3###SSSSSSSSSSSS$1%%%$2S@@@
$4        :%@@@@@@$3##SSSSSSSSS$1?$2****
$4          :%@@@@@@@@@$3####$4@#.
$4            :%@@@@@@@@@@@@;
$4              ???S@@@@@@@@.     """
        case "elixir":
            return """               ;S:
             ;#@@+
           ,S@@@@S
          :#@@@@@@;
         +@@@@@@@@@+
        ;@@@@@@@@@@@%,
       ,@@@@@@@@@@@@@@?,
       S@@@@@@@@@@@@@@@@*.
      ;@@@@@@@@@@@@@@@@@@S.
      ?@@@@@@@@@@@@@@@@@@@*
      %@@@@@@@@@@@@@@@@@@@%
      *@@@@@@@@@@@@@@@@@@@?
      ,@@@@@@@@@@@@@@@@@@@,
       :#@@%*?%S#@@$@@@@@#:
        .?@@S?+;:;#@@@@?.
          .;?S#@@@#S?;.         """
        case "erlang":
            return """
@@@?.        :*%%?+.        *@@@
@@*         %@@@@@@#.        ?@@
@S         .;;;;;;;;.        .@@
@;                            #@
@,         ,;;;;;;;;;;;;;;;;;;#@
@,         +@@@@@@@@@@@@@@@@@@@@
@+         ,@@@@@@@@@@@@@@@@@@@@
@#.         *@@@@@@@@@@@#;.:*S@@
@@%.         +#@@@@@@@#*.     ?@
@@@S,          *+:;:+*      ,S@@
@@@@@m                     m@@@@
                                """
        case "fortran":
            return """.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.
.S###@@@@@@@@#SS######@@@@@@@@@.
    .*@@@@@@@.        .,+#@@@@@.
     +@@@@@@@.    ,:::.  :#@@@@.
     ;@@@@@@@.    %@@@+   ?@@@@.
     ;@@@@@@@.   :@@@@+   :@@@@.
     ;@@@@@@@**?%@@@@@+   .%SS%.
     ;@@@@@@@@@@@@@@@@+
     ;@@@@@@@%%S#@@@@@+
     ;@@@@@@@.   +@@@@+
     :@@@@@@@,   .S@@@+
     ;@@@@@@@:    *###+
     ;@@@@@@@:
  ...?@@@@@@@*...
.##@@@@@@@@@@@@@##?
.@@@@@@@@@@@@@@@@@*             """
        case "f#":
            return """             ,%;$2%+
$1           ,?@@;$2S@#+
$1         .*@@@@;$2S@@@#+
$1       .*@@@@@@;$2S@@@@@#;
$1     .+#@@@@@#+.$2,%@@@@@@#;
$1    +#@@@@@@*,*:$2  :S@@@@@@S;
$1  ;#@@@@@@?,*#@;$2    ;S@@@@@@S;
$1;S@@@@@@?,+#@@@;$2      ;#@@@@@@S;
$1;S@@@@@@?,+#@@@;$2      :S@@@@@@S;
$1  +#@@@@@@*,*@@;$2    :S@@@@@@#;
$1    +#@@@@@#*,*:$2  ,%@@@@@@#;
$1     *?#@@@@@#+ $2,?@@@@@@#+
$1       *?@@@@@@;$2S@@@@@#+
$1         *?@@@@;$2S@@@#+
$1           *?@@;$2S@#+*
$1             *%:$2%+*             """
        case "go":
            return """           ;?S@@@S*.  ;?S###S*,
  ,;;;;;,:#@@S**%@#%;#@@S?*?@@@*
:;;;;;;::@@@: ;**?**@@@;    :@@@
    :::.+@@@.,??S@@@@@@.    *@@S
        .S@@#?*?@@#+S@@#?*?#@@%.
          ;%#@@#%+.  ;?#@@#S*,
                                """
        case "haskell":
            return """$2:?????,$1 *????+
$2 ;@@@@#;$1.%@@@@%.
$2  ,S@@@@* $1*@@@@#:
$2   .?@@@@S.$1:#@@@@+ $3.;;;;;;;;;;;;
$2     +@@@@#;$1.%@@@@%.$3+@@@@@@@@@@@
$2      ,#@@@@* $1*@@@@#:,$3PPPPPPPPPP
$2      ,#@@@@* $1*@@@@@@+ $3,........
$2     +@@@@#:$1.S@@@@@@@@%.$3+@@@@@@@
$2   .?@@@@S.$1:#@@@@+*@@@@#,$3,:::;;;
$2  ,#@@@@* $1*@@@@#,  :#@@@@+
$2 +@@@@#:$1.S@@@@%.    .S@@@@%.
$2:?????. $1*????+        +????+"""
        case "kotlin":
            return """
$1@@@@@@@@@@@@@@@@@$2@@@@@@@@@@@@@S:
$1@@@@@@@@@@@@@@@$2@@@@@@@@@@@@@S:
$1@@@@@@@@@@@@@$2@@@@@@@@@@@@@S:
$1@@@@@@@@@@@$2@@@@@@@@@@@@@S:
$1@@@@@@@@@$2@@@@@@@@@@@@@S:
$1@@@@@@@$2@@@@@@@@@@@@@S:
$1@@@@@$2@@@@@@@@@@@@@S:
$1@@@$2@@@@@@@@@@@@@S:
$1@$2@@@@@@@@@@@@@@$1@S;
$2@@@@@@@@@@@@@$1@@@@@S;
$2@@@@@@@@@@@$1@@@@@@@@@S:
$2@@@@@@@@@$1@@@@@@@@@@@@@S:
$2@@@@@@@$1@@@@@@@@@@@@@@@@@S:
$2@@@@@$1@@@@@@@@@@@@@@@@@@@@@S:
$2@@@$1@@@@@@@@@@@@@@@@@@@@@@@@@S:
$2@$1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@S:"""
        case "lua":
            return """         ,.., ,. :..: ,. ,?SS%+
      .,       ..      .,@@@@@@%
    ,,   .;?S#@@@@@S?+, ,#@@@@@?
  .:   :%@@@@@@@@@@#S%#S;,+%%?;
 :.  .%@@@@@@@@@@@;    ,SS,   :
..  .#@@@@@@@@@@@?      ;@@:  ..
,   %@@@@@@@@@@@@@;    ,S@@#   ,
:  .@@@#:@@@@@@@@@@#%%#@@@@@:  :
;  .@@@S,@@@@S*@@*S@+??+#@@@:  :
,   S@@S,@@@@S;@@+%@???:%@@#   ,
..  ,#@S,???%S:S%:%%:**:?@@:   ,
 :   ,S@####@@#S#@@@#S#@S#:   :
  .,   ;S@@@@@@@@@@@@@@#+   ,.
    ,.   ,+%#@@@@@@#%*:   .,
      ,,      .,,.      ,,
        .: ,. ,.., ,, :.        """
        case "mysql":
            return """S%%S?;.
%?  ,*%%%%*:
 +S,  ,,  :*S?:
  ;#. .?.    :%S:
   ??          :S%.
   .%?.          ?#:
     #;           ?@:
    :#             ?#,
    *?  :,          %#.
    +% :@S.         .%#,
    .S+?#+S.          +?%?+.
     .*?; :?,             :??:
            ::          .+*?%#?
                        ,##;.
                          :?S*.
                             ,+;
                               ,"""
        case "ocaml":
            return """#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@##@@@@@S#@@@@@@@@@@@@@@@@@@@@
#@%. :#@#,  *@@@@@@@@##@@@@@@@@@
#?    .*,    *@@@@@#.  ..,;#@@@@
,             +#@@@;   ,+??#@@@@
                .,,   ,@@@@@@@@@
  .                 .*@@@@@@@@@@
 +@#%*;;: .+;  ;SSS#@@@@@@@@@@@@
?@@@@@@#,,#@@S,:@@@@@@@@@@@@@@@@
#@@@@@@:,@@@@@S ?@@@@@@@@@@@@@@@
#@@@@@%:#@@@@@@?.@@@@@@@@@@@@@@@
+*%S%%:;??%S##SS;+%??***++*?%SSS"""
        case "perl":
            return """        .;*%S#@%@@#S%*;.
     .+S@@@@@@?+@@@@@@@@S+.
   .*@@@@@@@@@**;@@@@@@@@@@*.
  :#@@@@@@@@@#*++S@@@@@@@@@@#:
 ;@@@@@@@@@S+*%+::+%@@@@@@@@@@;
,@@@@@@@#+,;#%,S  ;+:;?@@@@@@@@,
?@@@@@S; :S#;:#+    :?;.+#@@@@@%
#@@@@?  ?@S.:@@.      +S,.%@@@@#
#@@@#  ?@@. #@%        ?#..#@@@#
?@@@S  #@# .@@*        ;@: S@@@?
,@@@@, ?@@; %@?        *@,,@@@@,
 :@@@#,.?@#:.S#.      :#:,#@@@;
  :#@@@*,:%@?,??    .**,*@@@#:
    +#@@@#?*?#%@S?+,;*S@@@#*.
      ;%@@@@@@#@##@@@@@@%;
         :+?%S####S%?+:         """
        case "powershell":
            return """
      ..........................
    .#@@@@@@@@@@@@@@@@@@@@@@@@@#
    *@@@@#;;%@@@@@@@@@@@@@@@@@@?
   .@@@@@#;  :%@@@@@@@@@@@@@@@@,
   *@@@@@@@S:  :S@@@@@@@@@@@@@%
  .#@@@@@@@@@%,  ;#@@@@@@@@@@@:
  +@@@@@@@@@@@@?   ?@@@@@@@@@S
  #@@@@@@@@@@%;  .+#@@@@@@@@@;
 ;@@@@@@@@S+. .+S@@@@@@@@@@@S
 S@@@@@#*, .;%@@@@@@@@@@@@@@;
:@@@@@:  ;?@@@%       +@@@@#
?@@@@@%?#@@@@@@%%%%%%%#@@@@+
@@@@@@@@@@@@@@@@@@@@@@@@@@S"""
        case "prolog":
            return """

       ++;.   ...    :++.
       ;@@#%S#@@@##%S@@%
       *@#S#@@@@@@@#SS#S.
     .?*.  ..;#@@?,   .:%:
     S*  $2+S%%+:$1@S$2  ,%%%?,$1#:
    ;@?  $2%%;?%$1+#%$2, ;S;*#:$1#S
    ?@@?,.,;;$2?@@@#$1;.,;++#@#.
    +@@@@@##@@$2#@@$1#@@##@@@@S
    .#@#@#@@@@@$2@$1@@@@@#@#@#+
     ;#@#@@@@@@@@@@@@@#@#%
     .##S#@@@@@@@@@@@@###;
      ;, $2?@@@@S?%@@@@#$1, +.
        $2.S;.,S+ .S;.,#:
         .       .   .          """
        case "python":
            return """$2         ,+?%S####S%?+.
$2        ;@%##@@@@@@@@@@+
$2        *@%;  @@@@@@@@@S
$2        *******%@@@@@@@S
$2  ;?SSSSSSSSSSSS@@@@@@@S$1,###%o.
$2.%@@@@@@@@@@@@@@@@@@@@@S$1,@@@@@#,
$2*@@@@@@@@@@@@@@@@@@@@@@+$1;@@@@@@S
$2%@@@@@@@@@S%%%%%%%%%%*:$1;#@@@@@@#
$2%@@@@@@@+,$1*%%%%%%%%%%M@@@@@@@@@#
$2*@@@@@@*$1:@@@@@@@@@@@@@@@@@@@@@@%
$2.S@@@@@+$1*@@@@@@@@@@@@@@@@@@@@@S*
$2  +%SSS;$1*@@@@@@@@%PPPPPPPPPPP*
$1        *@@@@@@@%%gggggg
$1        *@@@@@@@@@@  *@S
$1        ,#@@@@@@@@@?+#@*
$1          *!?%SSSSS%?+*         """
        case "r":
            return """
$2       ,;*?S##@@@@##S?*;,
    ;?#@@@@@@@@@@@@@@@@@@#?;
  +#@@@@@@@S?P***********%#@#+
.S@@@@@@%:   $1?%%%%%%%%%??m;$2;%@S.
%@@@@@#,     $1S@@@@@@@@@@@@@@+$2*@%
#@@@@@+      $1S@@@@S:::;S@@@@@$2,@#
*@@@@@%      $1S@@@@S::::S@@@@S$2:@*
 *@@@@@%,    $1S@@@@@@@@@@@@#?$2;#*
  ,?@@@@@S*:.$1S@@@@#S#@@@@?$2+%?,
    .;?#@@@@@$1@@@@@#?%@@@@@@*$2
        *****$1#@@@@#$2*+;+$1@@@@@?$2
             $1S@@@@?    :@@@@@%.
             PPPPPP     :PPPPP+
                                """
        case "raku":
            return """
$5
$5  ;?%%%%?+,           :+?%%?+,
$5,#S:$3;*++;$5S$4#$5?,      .*#%$3;,:;+;+$5%.
$5#%$3:%$2;:*;$3?$5;$4@*$5%,:. ;.S%$3.:;:*$5S#S$4?$3?$5S
$5##$3.:?*%+$5,%@;%?,**:*@$3.;**;+ ?$5$$4#;$5#@
$5;@#;$3.:,$5*SS?S*$1.%%%%,$5@$3;;*$2%*#$3+;@$5;$4S$5+
$5 :S@#%*$3++*$5#$1@@@@@@@@@@$5%+*$3:;;;;$5SS%;
$5   ,+?#@@#$1@@@@@@@@@@@@$5@@@@@S*:
$5    ;#@S%%#$1@@@@$2*o*$1@@@$5@%%S@@*
$5   ;@#$2:,%$3S$2;$5S%;:$1***$5;?#$2;$3S$2?,,$5S@?
$5   *@$2* +$3%$2*.$5#@@++?,S@#$2,?$3S$2+ ;$5@#
$5   .S@$2*:;*$5#@S, ,.,.?@#$2*;:+$5##;
$5     :+???+,        .;*??*;.

                                """
        case "ruby":
            return """$3             .:+*?*;,$1#@@@@@#%+.
$3          ,+$1S@@@@@@@%$3.?$1@@@@$2@@@#:$1
$3        ;$1S@@@@@@@@@@S$3:+$2?@@@@@@@%$1
$3      +$1#@@@@@@@@@@@@$3?$1@@@@@$2@@@@@S$1
$3    :$2S@$1@@@@@@@@@@@@$3+#$1@@@@@@@@@$2@%$1
$3   *$2@@@@@@$1@@@@@@@#$3,+$1@@@@@@@@@@@$2*$1
$3  ?$2@@@@@@@@@$1@@@@$3*,,$2:@@@@@@@@@@@$1;
$3 +$1@@@@$2@@@@@@@$3#%%$1@@@@@$2@@@@@@@@@$1@:
$3 %$1@@@@@@@$2@@S$3?%$1@@@@@@@@$2@@@@@@@$1@@.
$3:;*$1@@@@#$3%+;$2%@@$1@@@@@@@@@@@$2@@@$1@@#
%@$3,.:,...:$2@@@@@@@@@@@$1@@@@$2@$1@@@@S
S@#%$2S$3#@@@$2@@@@@@@@@@@@@@@@$1@@@@@?
#@@$2@@@$1@@@@$2@@@@@@@@@@@@$1@@@@@@@@+
%@@$2@@@@@$1@@$2@@@@@@@@$1@@@@@@@@@@@@;
,#$2@@@@@@@$1@$2@@@@@@$1@@@@@@@@@@@@@@,
  $2****;?S#$2##$1###%%PPPPP******** """
        case "rust":
            return """         :;,?%;SS;%?,+,
     ..#%#@@@#@;*@#@@@S%#..
   .;@@@#?;,  ,*+.  ,;?#@@@;.
  ,#@@@#????????????*+, ;S@@#,
 +@@S@##@@@@@#####@@@@@? ;##@@;
;#@#+%? @@@@@+,,,,%@@@@?.%?+@@S:
+#@@;   @@@@@@@@@@@@@@;    *@@S+
,S@@*  .@@@@@+,,,;#@@@@+ .#@@@S,
.+@@@@@@@@@@@@@@; +@@@@@@@@@@@;.
 :+#@@@??%?*****,  ;*??*?@@@#+:
  *+?@@@+?S         .#**@@@@+*
    *++@##@#%?****?%#@##@;+*
        *:+%*#@%@@%@#*S+:*
            **^^PP^^**            """
        case "scala":
            return """                      .:+%
           .,:;;+*?%S#@@@@.
      %S#@@@@@@@@@@@@@@@@@.
      @@@@@@@@@@@@@@@@@@@@
      @@@@@@@@@@@@@@@##$2SS+
      $1@@$2#####$2SSSS%%%%%%SS#.
      $1,,:;$2+*?SSSS$1###@@@@@@.
      %##@@@@@@@@@@@@@@@@@
      @@@@@@@@@@@@@@@@@@@#
      @@@@@@@@@@@@@@@##$2SS+
      $1#$2@####$2SSSS%%%%%%%SS#.
      $1.,:;+$2*?SSSS$1###@@@@@@.
      %#@@@@@@@@@@@@@@@@@@.
      #@@@@@@@@@@@@@@@@@@#
      @@@@@@@@@@@@@@S%?+:
      ##SSS%%???****             """
        case "swift":
            return """
                    ;?:
       :,            ;@S:
   ,;.  :*,           *@@%.
    .*?: .?%;          #@@#:
      ,SS+.:S#+.       ?@@@@;
        ;#@%;*#@%:     ?@@@@@,
         .*@@@%#@@#*:  #@@@@@?
           .*@@@@@@@@#%@@@@@@#
             .*#@@@@@@@@@@@@@#
:+:            .+S@@@@@@@@@@@?
 .?#%*;:,.   .,;+%@@@@@@@@@@@#;
   ,*#@@@@@@@@@@@@@@@@@@@@@@@@@:
      ;?#@@@@@@@@@@@@@@@@#SSS@@#
         ,;*%S#@@@@@#%*;.    .;#
                               ."""
        case "bash":
            return """$2          .:+++;;;++:.
      .;++;*        **++;.
  ,;++;*                **++;,
;*:*                        .;?;
S                        .:*S@@@
S                    .;*S@@@@@@@
S                .;*S@@@@@@@@@@@
S              ,%@@@@@@@@@@@@@@@
S              +@@@#:?@@@@@@@@@@
S              +@@S,%S@@@@@@@@@@
S,             +@@@%?.#@@#$1,m$2@@@#
**++.          +@@#*:S@$1m%P*$2@#%+.
    **++,.     +@@@@#@@@#?+,
        **++,. ;@@@@S?;,
            **%?##*,            """
        case "deno":
            return """        :+?S#@@@@@@#S?+:
     :?#@@@@@@S@@@S@@@@@#?:
   ;#@@@@#@@##S@#@#@#@@@#@@#+
 ,S@#@@@@#@#@@#@#@@@@@#@@@@@@S.
,#@#@##@@@@@@@@#@@@@#@#@@@@@@@#.
%@@#@@#@@#%*+;;;+?S@@@@@#@@#@@@%
@@@@#@@%*; ?,      :S@@@@@@#@@@@
@@@@@@S             .S@@@@@@@#@@
#@@@@@@?;:,,,:+**    ,@@@@@@@#@#
+@@@@@@@@@@@@@@;      S@@@@@@@@*
 *@@@@@@@@@@@@@+      ?@@@@#@@?
  ;#@@@@@@@@@@@*      *@@@@@#;
   .+#@@@@@@@@@*      ;@@@#+.
      :*S@@@@@@?,::;*?SS*:
         .;?#@@@@@@#?;.         """
        case "java":
            return """$2                  :;
                .+#%
             ,+%@@*..,:;,
          ,*#@@%++%#S*:
         +@@@*..#@@:
         ,#@S   %@@%,
           ;%S,  :#@S$1
   :+*?*;,.  .$2*$1. $2:?+$1..., ,;??+.
  .+?%%S#SSSS%%%%%???*:    ,@@+
      ?##?+++++++**??+.  .+#S+
       ,?S?++++*****:   ,;,.
;?%S*;::*?%SSSSSS%?*+:     ;*.
+%#@S?*+;;::::::::::;;+*?%%?;  :
   .,:+++++++++++++;;:::::;+***,
       .:+*??%%%SSSS###S%*;,    """
        case "javascript":
            return """@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@S%%#@@@#%???S@@@@@
@@@@@@@@@@@@@@;  ?@@*  .,. ,S@@@
@@@@@@@@@@@@@@;  ?@@  .#@@%@@@@@
@@@@@@@@@@@@@@;  ?@@?.  ,;*S@@@@
@@@@@@@@@@@@@@;  ?@@@@%*;.  :#@@
@@@@@@@@@S?#@@:  ?@#?+#@@@:  ?@@
@@@@@@@@S,  ,.  :@@?,  .,.  :#@@
@@@@@@@@@@S???%#@@@@@#%???%#@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"""
        case "julia":
            return """$2           :*S#@@#S*:
         ,S@@@@@@@@@@S,
        .#@@@@@@@@@@@@#.
        :@@@@@@@@@@@@@@:
        .#@@@@@@@@@@@@#.
         :#@@@@@@@@@@#:
           ;%#@@@@#%;
$3   .mmP@Pmm.  $2****$1   ,mmPPmm.
$3 ,%@@@@@@@@#*.     $1*#@@@@@@@@%:
$3;@@@@@@@@@@@@S.  $1.S@@@@@@@@@@@@;
$3#@@@@@@@@@@@@@+  $1+@@@@@@@@@@@@@#
$3#@@@@@@@@@@@@@+  $1+@@@@@@@@@@@@@#
$3;@@@@@@@@@@@@S.  $1.S@@@@@@@@@@@@;
$3 ,%@@@@@@@@#+      $1+#@@@@@@@@%,
$3   .*S@@#%;          $1;%#@@S*.   """
        case "nodejs":
            return """           ,;?S@@S?;,
       ,+?#@%*:..:*%@#?+,
  .:*%@#?+,          ,+?#@%*:.
+S@S?;,                  ,;?S@S+
@@+      :+;   :+**??*+;.    +@@
@@;      ?@S ,#@%+;  +*#@?   ;@@
@@;      ?@S ;@@?+;:,,.,..   ;@@
@@;      ?@S  , *?%%S#@@S?,  ;@@
@@;      ?@S %S?       ,@@?  ;@@
@@;      ?@S ,%##%mmmm%##?.  ;@@
#@%:.    ?@S    **^^^^**   .:%@#
.;*S@S?*?@@+           ,;?S@S*;.
    .:;++;,,,      ,+?#@%*:.
          ;?#@%**%@#?+,
             :%@@%:             """
        case "php":
            return """        ,+?%S#@@@@#S%?+,
     :?#@@@@@@@@@@@@@@@@#?:
   ;S@@@@@@@@@@@@@@@@@@@@@@S:
 .%@@@@@@@@@@@@@@@@@@@@@@@@@@%.
.S@@@@@@@@@@@@#S#@@@@@@@@@@@@@S.
?@@@@@#%%%SS@@; *SS#@#%%%S#@@@@*
@@@@@@+ +** .S ,**. #, **; ;@@@#
@@@@@@. ##? ,+ ?@# .% :#S+ +@@@@
S@@@@? :;;+%@++@@%;?: ;;+*S@@@@S
;@@@@*;#@@@@@@@@@@@@++@@@@@@@@@:
 +@@@@@@@@@@@@@@@@@@@@@@@@@@@@+
  :S@@@@@@@@@@@@@@@@@@@@@@@@S:
    ;S@@@@@@@@@@@@@@@@@@@@S;
      ,+%#@@@@@@@@@@@@#%+,
          :*%#@@@@#%*:          """
        case "sass":
            return """             ,;+?%S#@@@@@@#S?+,
        ,+?S@@@#S?*+;:::::;*S@@?
    .;?#@@#%*:.              #@@
  :%@@@S+,                 .?@@*
,%@@@?,                  :*#@S:
#@@@:      ,*:.. ..,:;*%#@S*,
S@@@,       .;*?%%%%?*+;,
 +S@@*,
   ,*S@#*:
      .;?##?**???**;,
     .;?SS?@@+****:+%S:
  .+S@S+. .#@*       +#
 ,#@@:   :S@S.      ;*,
 ;@@#**?#@S+.
  +#@@@S?,                      """
        case "typescript":
            return """@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@S%%%%%%%%%%#@@@S%%%S@@@@@
@@@@@@@,...   ....S@P* .,. ,#@@@
@@@@@@@@@@@:  #@@@@@,  #@@%@@@@@
@@@@@@@@@@@:  #@@@@@%,  ,;?#@@@@
@@@@@@@@@@@:  #@@@@@@@S?;,  :#@@
@@@@@@@@@@@:  #@@@@#%*#@@@+  ?@@
@@@@@@@@@@@:  #@@@@S:  ,,.  ;#@@
@@@@@@@@@@@S%%@@@@@@@@S%?%S#@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"""
        case "zsh":
            return """ .+%SS%+.      ;##,
;@@@%%@@@;   ,S@?.
S@@;  ;@@S .?@S:
*@@S**S@@?+##+
 ;%#@@#%?S@?.
    ..,?@S+;++;,
     +##?S@@@@@@%,
   :S@?.S@@*..*@@S
 .?@S,  S@@?,,?@@%
+##;    ,?@@@@@@?*..............
#S,       ,*%%*,  +@@@@@@@@@@@@#"""
        case "mariadb":
            return """                         :*%%S##
                       ;#@@@#?;
                     ,%@@@@#.
                 .:+%@@@@@@+
          ,;+*%S@@@@@@@@@@%
       ;%@@@@@@@@@@@@@@@@*
;??*+*S@S?***??%%%*#@#;;.
.%@S?+:          ;S?;.          """
    return ""
from sys import argv


def get_argv():

    """
    Get the ARGV
    """

    # Define variables
    lang = align = aligned = colors = color = sort = None


    # If the user want some help
    if "--help" in argv or "-h" in argv:
        print("""Langfetch is a CLI system information tool written in Python3. Langfetch displays information about the programming languages on your system and their version.
    --lang, -l   Which language should be displayed in ASCII art
    --align      Vertical align ("top", "center", "bottom")
    --aligned    Should it be aligned or not (true, false)
    --colors     Colors that should be used by the ascii art
    --color      The colors of the name of the languages
    --sort       Should the languages be sorted by name or not (true, false)""")
        exit(0)

    # Get the lang
    if "--lang" in argv or "-l" in argv:
        lang_index = (argv.index("-l") if "-l" in argv else argv.index("--lang")) + 1
        if lang_index < len(argv):
            lang = argv[lang_index]


    # Where should it be aligned
    if "--align" in argv:
        align_index = argv.index("--align") + 1
        if align_index < len(argv):
            align = argv[align_index]

    # Should it be aligned horizontally
    if "--aligned" in argv:
        aligned_index = argv.index("--aligned") + 1
        if aligned_index < len(argv):
            aligned = argv[aligned_index]

    # Add the colors if the user wants to
    if "--colors" in argv:
        index_colors = argv.index("--colors") + 1
        colors = []
        while index_colors < len(argv) and argv[index_colors][0] != '-':
            colors.append('#' + argv[index_colors])
            index_colors += 1


    # Get the color
    if "--color" in argv:
        color_index = argv.index("--color") + 1
        if color_index < len(argv):
            color = "#" + argv[color_index]


    # If it should be sorted
    if "--sort" in argv:
        sort_index = argv.index("--sort") + 1
        if sort_index < len(argv):
            sort = argv[sort_index] == "true"





    return {
        "lang": lang,
        "align": align,
        "aligned": aligned,
        "colors": colors,
        "color": color,
        "sort": sort,
    }
import re


def remove_ansi(text):
    # Matches any ANSI escape sequence
    ansi_escape_pattern = re.compile(r'\x1b[^m]*m')
    # Replaces all matches with an empty string
    return ansi_escape_pattern.sub('', text)



# Print it
# ========
def print_infos(ascii_art: list[str], lang_out: list[str], aligned: bool, align: str="center"):

    """
    A function that prints the info of the language
    with the ASCII art
    """

    first = max((len(ascii_art) - len(lang_out)) // 2, 0)
    second = (len(ascii_art) + len(lang_out)) // 2

    # If there is an horizontal align
    # We need to get the maximum line width
    if aligned:
        max_len: int = len(remove_ansi(max(ascii_art, key=lambda s: len(remove_ansi(s)))))
    else:
        max_len: int = -1


    match align:
        case "top":
            for i in range(max(len(ascii_art), len(lang_out))):
                line: str = ""

                # If it's the end of the ascii art
                # Add a blank line if aligned, else
                # just add nothing
                if i >= len(ascii_art):
                    line = " " * (aligned * max_len)
                    line += " " + lang_out[i]
                else:
                    line = ascii_art[i]

                    if i < len(lang_out):
                        line += " " * (aligned * (max_len - len(remove_ansi(ascii_art[i]))))
                        line += " " + lang_out[i]

                print(line)




        case "center":
            # First, print the language
            for i in range(first):
                print(ascii_art[i])

            for i in range(first, second):
                # If it shouldn't be aligned
                if i < len(ascii_art):
                    if not aligned:
                        print(ascii_art[i], lang_out[i - first])
                    else:
                        print(ascii_art[i],
                            (" " * (max_len - len(remove_ansi(ascii_art[i])))) +
                            lang_out[i - first]
                        )
                else:
                    print(" " * (aligned * -~max_len) + lang_out[i - first])

            for i in range(second, max(len(ascii_art), len(lang_out))):
                if i < len(ascii_art):
                    print(ascii_art[i])
                else:
                    print(" " * (aligned * -~max_len) + lang_out[i])



        case "bottom":
            for i in range(max(len(ascii_art), len(lang_out))):
                line: str = ""

                # If it's the end of the ascii art
                # Add a blank line if aligned, else
                # just add nothing
                if i >= len(ascii_art):
                    line = " " * (aligned * max_len)
                    line += " " + lang_out[i]
                else:
                    line = ascii_art[i]

                    lang_it = i - len(ascii_art) + len(lang_out)

                    if lang_it >= 0:
                        line += " " * (aligned * (max_len - len(remove_ansi(ascii_art[i]))))
                        line += " " + lang_out[i]

                print(line)
from os.path import isfile, expanduser


# Load the language informations from the JSON
if isfile("/".join(__file__.split("/")[:-1]) + "/" + "languages.json"):
    LANGUAGES_JSON = load(open("/".join(__file__.split("/")[:-1]) + "/" + "languages.json", 'r', encoding="utf-8"))
elif isfile("/usr/share/langfetch/languages.json"):
    LANGUAGES_JSON = load(open("/usr/share/langfetch/languages.json", 'r', encoding="utf-8"))
else:
    logger.error("No languages.json file found")
    exit(127)


# Functions
## Convert hex to list
hex_to_list = lambda s: [str(int(s[1 + i * 2:1 + -~i * 2], 16)) for i in range(3)]
## Convert rgb to ANSI
rgb_to_ansi = lambda s: f"\033[38;2;{';'.join(hex_to_list(s))}m"



# The languages to display
langs = []
main_lang = "Python"
max_popularity = -1
for language, data in LANGUAGES_JSON.items():
    if isfile(data["path"]):
        langs.append(language)

        if data["popularity"] > max_popularity:
            max_popularity = data["popularity"]
            main_lang = language

# langs = ["Python", "gcc", "Bash", "Perl"]
# main_lang = "Python"

# The output of the languages
lang_out = []

# If it must be aligned
aligned = True

# Aligned to top, center or bottom
align = "center"

# Define the color of the Ascii art
colors = None

# The variable that is here to put color on the name of the language
color_lang = None

# Do we need to sort the languages
sort = None


if isfile(expanduser("~") + "/.config/langfetch/config.json"):
    # Read the default values from the file
    with open(expanduser('~') + "/.config/langfetch/config.json") as config_json:
        data = load(config_json)

        main_lang = data.get("lang", main_lang)
        align = data.get("align", align)
        aligned = data.get("aligned", aligned)
        colors = data.get("colors", colors)
        color_lang = data.get("color", color_lang)
        sort = data.get("sort", sort)
        langs = data.get("langs", langs)



# Get the argv
params = get_argv()

if "lang" in params and params["lang"] is not None:
    main_lang = params["lang"]
if "align" in params and params["align"] is not None:
    align = params["align"]
if "aligned" in params and params["aligned"] is not None:
    aligned = params["aligned"]
if "colors" in params and params["colors"] is not None:
    colors = params["colors"]
if "color" in params and params["color"] is not None:
    color_lang = params["color"]
if "sort" in params and params["sort"] is not None:
    sort = params["sort"]


# Sort the languages
if sort:
    langs.sort(key=lambda c:c.lower())

# For each lang that we want to have the version of
# ==================================================
for lang in langs:
    if lang.lower() in LANGUAGES_JSON:
        # Get the attributes of a lang
        lang_attributes = LANGUAGES_JSON[lang.lower()]
        color = "\033[1m"

        # If there is a color
        if "colors" in lang_attributes and len(lang_attributes["colors"]) > 0 and color_lang is None:
            color = rgb_to_ansi(lang_attributes['colors'][0])
        elif color_lang is not None:
            color = rgb_to_ansi(color_lang)



        # If there is all the correct data
        if "path" in lang_attributes and "regex" in lang_attributes and "version" in lang_attributes:
            # Put the values in some variables
            version, path, regex = lang_attributes["version"], lang_attributes["path"], lang_attributes["regex"]

            # Execute the command to get the version
            sys_version = run([path, version], capture_output=True, text=True)
            # Match it with a regex
            match_regex = search(regex, sys_version.stdout + sys_version.stderr)

            # If there is a match
            if match_regex:
                lang_out.append(f"\033[1m{color}{lang}\033[0m: {match_regex.group(0)}")
            else:
                logger.warning(f"There is a problem with the version of {lang}")
        else:
            logger.warning(f"There is an error with {lang}, missing some fields")
            continue
    else:
        logger.warning(f"{lang} doesn't exist")



# Get the ASCII art
# =================
ascii_art: str = "$1" + get_ascii_art(main_lang)


# Get the colors of the language
if main_lang.lower() in LANGUAGES_JSON and colors is None:
    colors = LANGUAGES_JSON[main_lang.lower()]["colors"]
elif colors is None:
    logger.error("No language with that name")
    exit()


# Restore the color at the start of the line
curr_color = "$1"
for i in range(len(ascii_art)):
    if ascii_art[i] == '$':
        if len(ascii_art) != i - 1 and ascii_art[i + 1].isdigit():
            curr_color = f'${ascii_art[i+1]}'
    elif ascii_art[i] == '\n':
        ascii_art = ascii_art[:i + 1] + curr_color + ascii_art[i + 1:]

for i,color in enumerate(colors):
    ascii_art = ascii_art.replace(f"${i+1}", rgb_to_ansi(color))

ascii_art = ascii_art.split("\n")



# Print it
# ========
print_infos(ascii_art, lang_out, aligned, align=align)
