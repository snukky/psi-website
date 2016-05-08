---
layout: page
title: Zespół
permalink: /team/
lang: pl
---

{% for member in site.data.members %}
<p>
  <span class="member-name">{{ member.title[page.lang] }} {{ member.name }}.</span>
  {{ member.description[page.lang] }}
</p>
{% endfor %}
