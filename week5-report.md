# Week 5 Report

Out of the three commands, `less`, `grep`, and `find`, I chose to do more research of the `find` command. Here are some interesting command-line options and examples of the command:

## Option 1
### `-type`

**Example 1:** 

Using the command:
```
find . -type f | xargs grep yes
```

I found all text files in my working directory, `technical/` that contained the word "yes". It should be noted that the text found is case sensitive, as when I ran it with "Yes", I found less files. The `-type f` stands for find (f)iles. 

**Example 2:** 

Using the command:
```
find ./plos -type f | xargs grep "this assumption"
```

If I wanted to find text in all technical/plos files, I would have to use quotes to find text containing ` ` (a space). This is useful because I can search for more than just one word or sequence of letters.


**Example 3:** 

Using the command:

```
find . -type d
```

I found all directories and subdirectories within my working directory. This can be useful to quickly find all ways a set of files have been sorted. I could also output them onto a file and use the lines to find other files.

## Option 2
### `-amin`

**Example 1:**

Using the command:
```
find . -amin 10 
```
This allows you to find all the files edited 10 minutes ago. It is useful if you are editing a file on a remote server and it disconnects because of internet issues, you can retun back to your work. Additionally, `-amin` is also 

**Example 2:**

Using the command:
```
find . -amin -10
```

Sometimes we may not be able to find all the files edited exactly 10 min ago. Using the `-`, we can find all files edited less than 10 minutes ago. This allows you to see all files changed at this point.

**Example 3:**

Using the command:
```
find . -amin +1000
```

This returns all files that have been edited greater than 1000 min ago. This can return how old a set of files are because the user can deduce the oldest file of a set of files.


## Option 3
### `-size n`

**Example 1:**

Using the command:

```
find . -size 10k
```

I found all files in directory with the size of 10 kB. This is useful because it can help me find a file I do not remember the name but have a general idea of how large the file is. It is essentially another way for me to find files. I can also use other keywords like b (512 byte-blocks), c (bytes),  w (two bytes), k (kilobytes), M (megabytes), and G (gigabytes).

**Example 2:**

Using the command:
```
find ./plos -size -2k
```

This command is useful because it searches through all of technical/plos and finds all files with a size under 2 kB, then prints the relative path into the terminal.

**Example 3:**

Using the command:
```
find ./biomed -size +50k
```

This command is useful because it searches through all of technical/biomed and finds all files above the size 50kB using the `+` symbol.
