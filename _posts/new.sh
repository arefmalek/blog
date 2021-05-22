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
