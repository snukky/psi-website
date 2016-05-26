---
---
{{ entry.author }}. {{ entry.title }}, ({{ entry.year }}) <a class="download-pdf" href="{{ entry.url }}">[PDF]</a>
{% if entry.abstract %}
> {{ entry.abstract }}
{% endif %}
