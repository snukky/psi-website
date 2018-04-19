---
---
{{ entry.author }}. {{ entry.title }}, {{ entry.address }} ({{ entry.year }}) <a class="download-pdf" href="{{ entry.url }}">
  {% icon fa-file-pdf-o %}
</a>
{% if entry.abstract %}
> {{ entry.abstract }}
{% endif %}
