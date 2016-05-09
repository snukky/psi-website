---
layout: page
title: Seminarium
permalink: /seminar/
lang: pl
---

Nasza grupa organizuje cotygodniowe seminarium na temat przetwarzania języka
naturalnego, w każdy wtorek o godzinie 13:15 w sali seminaryjnej B1-37 na WMiI
UAM (ul. Umultowska 87, Poznań).

Zapraszamy wszystkich zainteresowanych tematyką NLP i ML.

Wystąpienia
-----------

<div class="seminars">
  {% for seminar in site.data.seminars reversed %}
  <div class="seminar">
    <div class="date">{{ seminar.date | date:"%d.%m.%Y r." }}</div>
    <div class="box">
      <div class="title">{{ seminar.title }}</div>
      <div class="author">{{ seminar.author }}</div>
      <div class="abstract">{{ seminar.abstract }}</div>
    </div>
  </div>
  {% endfor %}
</div>
