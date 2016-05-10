---
layout: page
title: Team
permalink: /team/
lang: en
sidebar: 1
---

{% for member in site.data.members %}
{% if member.active == nil or member.active %}
<div class="member">
  <span class="member-photo photo-{{ member.id }}" default="{{ asset_path silhouette.jpg }}"></span>
  <p>
  <span class="member-name">{{ member.name }}, {{ member.title[page.lang] }}.</span>
  {% if member.description[page.lang] != nil %}
    {{ member.description[page.lang] }}
  {% else %}
    {{ member.description[site.default_lang] }}
  {% endif %}
  </p>
</div>
{% endif %}
{% endfor %}
