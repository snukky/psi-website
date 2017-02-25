---
layout: page
title: Tools
permalink: /tools/
lang: en
sidebar: 5
---

A list of tools and resources developed by members of the PSI research group.

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
