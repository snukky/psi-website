---
layout: page
title: Zasoby
permalink: /tools/
lang: pl
sidebar: 5
---

Lista narzędzi i zasobów stworzonych przez członków Pracowni.

<ul>
{% for tool in site.data.tools %}
  <li>
    <strong>{{ tool.name }}</strong>
    - {{ tool.description[page.lang] }}
    {% if tool.www != null %}
      <a href="{{ tool.www }}">{% icon fa-globe fa-lg %}</a>
    {% endif %}
    {% if tool.github != null %}
      <a href="https://github.com/{{ tool.github }}">{% icon fa-github fa-lg %}</a>
    {% endif %}
  </li>
{% endfor %}
</ul>
