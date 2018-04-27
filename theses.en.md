---
layout: page
title: Theses
permalink: /theses/
lang: en
sidebar: 4
---

## PhD Theses

{% bibliography --file theses.bib --query @phdthesis --template bib.thesis %}

## Master's Theses

{% bibliography --file theses.bib --query @mastersthesis --template bib.thesis %}
