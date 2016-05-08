---
layout: page
title: Zasoby
permalink: /tools/
lang: pl
---

Lista narzędzi i zasobów stworzonych przez członków Pracowni.

<ul>
{% for tool in site.data.tools %}
  <li>
    <a href="{{ tool.www | tool.github }}">
      {{ tool.name }}
    </a>
    - {{ tool.description[page.lang] }}
  </li>
{% endfor %}
</ul>
