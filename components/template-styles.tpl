{% capture template_styles %}
  <style>
    {% assign bg_area_index = 0 %}

    {% for page_data in page.data %}
      {% comment %}Must be captured to convert it to string and check if it contains substring.{% endcomment %}
      {% capture page_data_string %}{{ page_data }}{% endcapture %}
      {% comment %}Generate styles only for background data.{% endcomment %}
      {% if page_data_string contains "bg_picker_" %}
        {% assign bg_area_index = bg_area_index | plus: 1 %}

        {% comment %}TODO: Use "min-width" and "min-height" based queries if possible.{% endcomment %}
        {% assign image_sizes_reversed = page_data[1].imageSizes | reverse %}

        {% for image_size_variation in image_sizes_reversed %}
          {% if forloop.first %}
            @media screen and (max-width: {{ image_size_variation.width }}px), screen and (max-height: {{ image_size_variation.height }}px) {
              [data-bg-area-index='{{ bg_area_index }}'] {
                background-image: url("{{ image_size_variation.url }}");
              }
            }
          {% else %}
            {% assign previous_image_variation = forloop.index | minus: 2 %}

            @media screen and (min-width: {{ image_sizes_reversed[previous_image_variation].width | plus: 1 }}px), screen and (min-height: {{ image_sizes_reversed[previous_image_variation].height | plus: 1 }}px) {
              [data-bg-area-index='{{ bg_area_index }}'] {
                background-image: url("{{ image_size_variation.url }}");
              }
            }
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endfor %}
  </style>
{% endcapture %}

{% comment %}{{ template_styles | strip_newlines | replace: "  ", "" }}{% endcomment %}
{{ template_styles }}
