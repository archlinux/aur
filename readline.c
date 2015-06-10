/*************************************************************
 *  This file is an extension for the Surface Evolver        *
 *  Programmer: Laszlo Csirmaz, csirmaz@renyi.hu             *
 ************************************************************/


/************************************************************************
*
*   File: readline.c
*
*  Purpose: automatic extension by using the "readline" library
*
*
*/

#ifdef USE_READLINE

#include <readline/readline.h>
#include <readline/history.h>

static int whspace(char c)
{  switch(c){
      case ' ': case '\t': case '\r': case '\n': return 1;
      default: break;
   }
   return 0;
}

static char *stripwhite(char *str)
{char *s,*t;
    for(s=str;whspace(*s);s++);
    if(*s==0) return s;
    t=s+strlen(s)-1;
    while(t>s && whspace(*t))t--;
    *++t='\0';
    return s;
}

/* list of extended words in alphabetical order; no single letter
   word is extended */
static char *head[]={
#include "rl_head.h"
NULL
};
static char *middle[]={
#include "rl_mid.h"
NULL
};

static char **expand_from;
static int do_file_expand=0;
static int save_history=1;
static char *lastline = NULL;
static int lastlinepos = 0;
static int readline_initialized=0;

static char * match_generator(const char *txt, int state)
{static int list_index,len; char *name;
    if(state==0){ /* first call */
        list_index=0;
        len=strlen(txt);
    }
    while( (name=expand_from[list_index])!=NULL ){
       list_index++;
       if(strncmp(name,txt,len)==0)
           return strdup(name);
    }
    return (char*)NULL;
}

static char **my_comp( const char *text, int start, int end)
{
    // the string to be completed starts at "start" 
    if(do_file_expand == 0){ /* no filename extension */
       expand_from = start ? middle : head;
       return rl_completion_matches(text,match_generator);
    }
    rl_attempted_completion_over = 0;
    return (char **)NULL; /* filename extension */
}


void save_readline_history(void)
{ char *HOME, hist[PATHSIZE];
  HOME=getenv("HOME"); if(HOME){
     hist[PATHSIZE-1]=0;
     strncpy(hist,HOME,PATHSIZE-1);
     strncat(hist,"/.evolver",PATHSIZE-1-strlen(HOME));
     write_history(hist);
  }
}

static int use_readline(char *prompt, char *inmsg, int max )
{int len; char *s;
    if(readline_initialized==0){
        char *HOME, hist[PATHSIZE];
        readline_initialized=1;
        rl_readline_name="evolver";
        rl_attempted_completion_function=my_comp;
        using_history(); /* initialize */
        HOME=getenv("HOME"); if(HOME){
            hist[PATHSIZE-1]=0;
            strncpy(hist,HOME,PATHSIZE-1);
            strncat(hist,"/.evolver",PATHSIZE-1-strlen(HOME));
            read_history_range(hist,0,100);
        }
    }
    if(prompt == CONTPROMPT ){ /* next part of lastline */
        s=lastline+lastlinepos;
        len=strlen(s); strncpy(inmsg,s,max); 
        if(len >= max-1) {
           inmsg[max-1]=MOREIN; inmsg[max]=0; len=max-1;
        }
        lastlinepos += len;
        return 1;
    } 
    if(prompt == MOREPROMPT ){ /* continuation line */
        /* do not add to the history yet */
        char *contline,*new;
        contline = readline( topflag ? "" : "more> " );
        if(!contline){ contline = strdup(""); }
        s=stripwhite(contline);
        new=malloc(lastlinepos+strlen(s)+2);
        if(!new){ /* pretend got nothing */
            free(contline);
            s=lastline+lastlinepos;
        } else {
            strncpy(new,lastline,lastlinepos);
            strcpy(new+lastlinepos," ");
            lastlinepos++;
            strcpy(new+lastlinepos,s);
            free(lastline); free(contline); lastline=new;
            s=lastline+lastlinepos;
        }
    } else { /* read next line */
        if(lastline){
           s=stripwhite(lastline); if(save_history && *s && s[1] && s[2]){
               HIST_ENTRY **hl; int n,i,found;
	       /* if it is not on the history list, put it on;
	          otherwise move the line to the last one */
               hl=history_list(); /* get the history list */
               found=0;
               if(hl){ /* find the current line */
                   i=0;
                   for(n=0; *hl && (*hl)->line ; hl++,n++);
                   while(found==0 && n>0 && i<10){
                       i++; n--; hl--; 
                       if(strcmp((*hl)->line,s)==0){
                           HIST_ENTRY *old;
                           found=1;
                           old=remove_history(n);
                           if(old && old->line) free(old->line);
                       }
                   }
               }
               add_history(s);
           }
           free(lastline);
        }
        do_file_expand=0; save_history = 1;
        if( strstr(prompt,"file") ) do_file_expand=1;
        if( strcmp(prompt,"Graphics command: ")==0) save_history = 0;
        lastline = readline(prompt);
        if(!lastline) { /* EOF */
            return EOF;
        }
        s=stripwhite(lastline); lastlinepos=s-lastline;
    }
    len=strlen(s);  strncpy(inmsg,s,max);
    if(len >= max-1) {
       inmsg[max-1]=MOREIN; inmsg[max]=0; len=max-1;
    }
    lastlinepos += len;
    return 1;
}


#endif
