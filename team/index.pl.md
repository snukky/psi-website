---
layout: page
title: Zespół
permalink: /team/
lang: pl
sidebar: 1
---

{% for member in site.data.members %}
<div class="member">
  <span class="member-photo photo-{{ member.id }}" default="{{ asset_path silhouette.jpg }}"></span>
  <p>
  <span class="member-name">{{ member.title[page.lang] }} {{ member.name }}.</span>
    {% if member.description[page.lang] != nil %}
      {{ member.description[page.lang] }}
    {% else %}
      {% lorem_ipsum 40 %}
    {% endif %}
  </p>
</div>
{% endfor %}
