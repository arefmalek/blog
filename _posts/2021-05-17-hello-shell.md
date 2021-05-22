---
layout: post
title:  "Experimenting with Shell Scripts"
date:   2021-05-22
categories: Learning
---


Recently I have been experimenting with new ways to document the stuff I write
and although I'm hesitant to say it's the best, I have the most hope for Jekyll
so far as it's been the most straightforward route for me to set up something
easy to record my processes.

I would try to write something unique on this topic, but truthfully this
[article](https://ndench.github.io/jekyll/setup-jekyll-on-github-pages) has everything you really need and some more. The only thing I will
mention about my experience with setting up Jekyll is that I have had to run
``bundle add webrick``, which is just another gem (think library in other
programming languages) that would ensure our environment will deploy correctly. 

The real fun thing I wanted to leave here was a shell script I have been
experimenting with to help me out a little bit. I am no stranger to running
shell scripts (it's one of the things about Linux I really enjoy, all of the
setup is so satisfying when it goes smoothly), but now it was time for me to
start automating to improve my experience.

I'll paste everything below, but I'll try and explain line by line what's going
on.

```
#!/bin/zsh

title=$1
date=`date +'%Y-%m-%d'`
fname="$date-$title.md"

echo "---
layout: post
title: $title
date: $date
---
" > $fname

nvim $fname
```

I should preface this by saying that although it's not a whole lot, really all of 5 commands, I wanted to share this
because I find it fascinating that I can encapsulate a 30-second thinking
process in 5 lines, solving the problem (hopefully forever).

```title=$1``` This line involves the command line arguments! This essentially
makes it so that if I ran ```sh new.sh pog```, ``title`` would be equivalent to
``pog``. The reason we are using the 1 index instead of the 0th index is
because the 0th index is the name of the shell script (here it is new.sh). 

```date=`date +'%Y-%m-%d'``` Similar to before, all we are really doing in this
line is storing a variable, but this one has a little bit of flavor. This
command really gets its power from the ``date`` command. If you want to
experiment in [shell](https://www.onlinegdb.com/online_bash_shell), you can start by seeing the progression of these
commands

```
echo "hello world!";
echo "$(date)";
echo "`(date +'%Y')`";
echo "`(date +'%Y-%m-%d')`";
```

should output something like 

```
hello world!
Sat May 22 06:40:55 UTC 2021
2021
2021-05-22
```

``echo`` is just the equivalent of a print statement for the terminal, but what
I want to stress here are the last two commands. We can see from the second
command that this ``date`` command gives us all the information needed in order
to format a jekyll post, but you can also specifically pick out the information
that jekyll needs for a post with the % specifics.

``fname="$date-$title.md"`` This is the final variable being set, to be honest
I really just assigned this because I was bored and didn't want to rewrite the
quotation marks, date, and title again later on.

```
echo "---
layout: post
title: $title
date: $date
---
" > $fname
```
Truthfully, I think you have all the information to see this one works, just
know that the ``>`` operator just means that instead of printing to the
terminal, that infomation is stored in the filename (which was defined above).
Feel free to experiment on the [shell](https://www.onlinegdb.com/online_bash_shell) available if you're interested.

``nvim $fname`` Now it's time to write! I just have the shell open up a neovim
window for me to start writing up an article.

This might have been a little bit extra for so small of a shell script, but
this was a cute thing I wrote up that I just felt like sharing. This is a blog
after all :)
