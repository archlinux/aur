# web2pdf

A CLI tool to extract a part of a website, create a PDF

(new version now support  both class and id , even some styling )

(new version now support  --comic-mode read document for more info )

------

> let me tell u a really fun story
> i am a manga and lightnovel fan 
>
> lightnovels r novels that never become a book 
> r really better than many books 
> they rarely become even pdf 
> some of them even dont get translated to english and r still korean
>
> so i wanted to read them as pdf and doing it manually is really hard and boring
>
> so lets go to point 
> i wrote my own tools to do so -------- web2pdf

it is totally cool u just give it

1. **web page** 
2. **the part that contain novel or anything ( id or class )**

and it do the job
it make all of it to a  ***perfect pdf*** 

it is called **web2pdf**



# how to install

if u use arch linux btw

`yay -S web2pdf`

available in aur 

 https://aur.archlinux.org/packages/web2pdf

if u wanna compile it yourself 

1. clone repository

2. go to cloned file

3. go to venv using 
    `cd ./bin/    &  source activate` 

4. install dependancies 

   `pip install requests beautifulsoup4 reportlab`  

5. run and enjoy using python 

   `python web2pdf.py`

6. u can even make build its binary  yourself it is easy

    

# how to use ?

``` usage: web2pdf.py [-h] [--id ID] [--class CLASS_NAME]
     
usage: web2pdf.py [-h] [--id ID] [--class CLASS_NAME]
                  [--exclude EXCLUDE [EXCLUDE ...]] [--comic-mode]
                  url pdf_name

Save webpage content as PDF or images

positional arguments:
  url                   URL of the webpage to scrape
  pdf_name              Name of the PDF file to save

options:
  -h, --help            show this help message and exit
  --id ID               ID of the content to extract
  --class CLASS_NAME    Class name of the content to extract
  --exclude EXCLUDE [EXCLUDE ...]
                        Class names of elements to exclude
  --comic-mode          Save images and pdf them (like a real comic or manga)``` 

```

- `--comic-mode`    : sometimes u wanna download a manga or comic from INTERNET

  they have a part that comic is saved using very long images that r put tougher  

  downloading them one by one and make a pdf out of it is hard and somehow impossible 

  you can use web2pdf using `--comic-mode` these times 

  1. it will make a dir with the same name of pdf and save all of page images 
  2. and than make a pdf out of it

- ` --id ID               ID of the content to extract
    --class CLASS_NAME    Class name of the content to extract
    --exclude EXCLUDE [EXCLUDE ...]`

  these args r optional by default it will make a pdf out of all website 



# what to do next

- [ ] maybe adding translation ability to cli tools

  

# end ?!

in the end i will be happy if u share your ideas about this script with me 

TY so much ❤️
