{% capture dont_render %}
  {% comment %}Detects viewing mode.{% endcomment %}
  {% if editmode %}
    {% assign view_mode = "is-editmode" %}
  {% else %}
    {% assign view_mode = "is-publicmode" %}
  {% endif %}
{% endcapture %}
