---
layout: page
title: Seminar
permalink: /seminar/
lang: en
sidebar: 2
---

Our group organizes seminar on natural language processing. It takes place on
Tuesdays, normally at 1:15 pm, in the B1-37 seminar room of the Faculty of
Mathematics and Computer Science at AMU (Umultowska 87 Street, Poznań).

Everybody who is interested in NLP and ML is welcome.

Lectures
--------

<div class="seminars">
  {% for seminar in site.data.seminars reversed %}
  <div class="seminar">
    <div class="date">{{ seminar.date | date:"%d/%m/%Y" }}</div>
    <div class="box">
      <div class="title">{{ seminar.title }}</div>
      <div class="author">{{ seminar.author }}</div>
      <span class="institute">{{ seminar.institute }}</span>
      <div class="abstract">{{ seminar.abstract }}</div>
    </div>
  </div>
  {% endfor %}
</div>
