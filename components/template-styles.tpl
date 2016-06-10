{% capture template_styles %}
  <style>
  {% assign bg_area_index = 0 %}

  {% for page_data in page.data %}
    {% comment %}Must be captured to convert it to string and check if it contains substring.{% endcomment %}
    {% capture page_data_string %}{{ page_data }}{% endcapture %}
    {% comment %}Generate styles only for background data.{% endcomment %}
    {% if page_data_string contains "bg_picker_section_" %}
      {% assign bg_area_index = bg_area_index | plus: 1 %}

      {% comment %}TODO: Use "min-width" and "min-height" based queries if possible.{% endcomment %}
      {% for bg_data in page_data[1].imageSizes %}
        {% if forloop.first %}
          [data-bg-area-index='{{ bg_area_index }}'] {
            background-image: url("{{ bg_data.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ bg_data.width }}px) and (max-height: {{ bg_data.height }}px) {
            [data-bg-area-index='{{ bg_area_index }}'] {
              background-image: url("{{ bg_data.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endfor %}
  </style>
{% endcapture %}

{{ template_styles | strip_newlines | replace: "  ", "" }}
