---
layout: page
title: Prace dyplomowe
permalink: /theses/
lang: pl
sidebar: 4
---

## Prace doktorskie

{% bibliography --file theses.bib --query @phdthesis --template bib.thesis %}

## Prace magisterskie

{% bibliography --file theses.bib --query @mastersthesis --template bib.thesis %}
