---
layout: default
title: SICP Study
---
# {{ page.title }}

Source for exercises and examples from [Structure and Interpretation of Computer Programs](http://mitpress.mit.edu/sicp/full-text/book/book.html)

I've tried to consolidate various sources of code used in an SICP class.

## Code Respository

The master branch of the repository has several folders of code.

**assignments**: Assignments from the [Sample Programming Assigmnets on the SICP web site.](http://mitpress.mit.edu/sicp/psets/)
Some of these are old, and have dependencies on an older version of MIT Scheme. I'll try to update as necessary, but I'm not paying strong attention to these problem sets.

**allcode**
[Code from the text.](http://mitpress.mit.edu/sicp/code/index.html)
This should be current.

**projects**
Projects from [MIT OpenCourseWare course 6.001](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/projects/)

**exercises**
These are my attempts at solutions to the exercises in the book. I'm not currently attempting to be complete, and my solutions may be completely wrong. Caveat Schemer.

## Exercises & Notes
I've written up some posts on my [solutions]({{site.url}}/solutions/) to the exercises and [notes]({{site.url}}/notes/) on the text. I'll be migrating them from Blogger to Github Pages.

## Blog
For posts about my work on the site and the exercises.
{% for post in site.posts %}
* [{{ post.title }}]({{ site.url }}{{ post.url }})
{% endfor %}
