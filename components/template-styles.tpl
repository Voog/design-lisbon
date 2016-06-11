{% capture template_styles %}
  <style>
    {% comment %}Generates styles for backgrond images and colors saved with background pickers.{% endcomment %}
    {% assign bg_area_index = 0 %}

    {% for page_data_object in page.data %}
      {% comment %}Must be captured to convert it to string and check if it contains substring.{% endcomment %}
      {% capture page_data_object_string %}{{ page_data_object }}{% endcapture %}
      {% comment %}Generate styles only for background data.{% endcomment %}
      {% if page_data_object_string contains "bg_picker_" %}
        {% assign bg_area_index = bg_area_index | plus: 1 %}

        {% comment %}TODO: Use "min-width" and "min-height" based queries if possible.{% endcomment %}
        {% assign image_sizes_reversed = page_data_object[1].imageSizes | reverse %}

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

          [data-bg-area-index='{{ bg_area_index }}'] [data-bg-picker="color-overlay"] {
            background-color: {{ page_data_object[1].color }};
          }
        {% endfor %}
      {% endif %}
    {% endfor %}

    {% comment %}Styles for default background images and colors.{% endcomment %}
    {% if page.data.bg_picker_section_1 == nil %}
      @media screen and (max-width: 600px), screen and (max-height: 350px) {
        [data-bg-area-index='1'] {
          background-image: url("/images/section-main-bg_block.jpg");
        }
      }

      @media screen and (min-width: 601px), screen and (min-height: 351px) {
        [data-bg-area-index='1'] {
          background-image: url("/images/section-main-bg_large.jpg");
        }
      }

      @media screen and (min-width: 1281px), screen and (min-height: 748px) {
        [data-bg-area-index='1'] {
          background-image: url("/images/section-main-bg_huge.jpg");
        }
      }

      @media screen and (min-width: 2049px), screen and (min-height: 1196px) {
        [data-bg-area-index='1'] {
          background-image: url("/images/section-main-bg.jpg");
        }
      }
    {% endif %}


  </style>
{% endcapture %}

{% comment %}TODO: Minify when done developing.{% endcomment %}
{{ template_styles }}
