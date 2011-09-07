#!/bin/sh

maruku --html-frag -o _includes/notes-nav.html _includes/notes-nav.markdown
maruku --html-frag -o _includes/solutions-nav.html _includes/solutions-nav.markdown
