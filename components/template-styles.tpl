{% capture template_styles %}
  <style>
    {% comment %}[[ SECTION 1 BACKGROUND START ]]{% endcomment %}
    {% unless bg_picker_section_1 == nil %}
      {% assign image_sizes_reversed = bg_picker_section_1.imageSizes | reverse %}

      {% for image_size_variation in image_sizes_reversed %}
        {% if forloop.first %}
          @media screen and (max-width: {{ image_size_variation.width }}px), screen and (max-height: {{ image_size_variation.height }}px) {
            [data-bg-area='section-1'] {
              background-image: url("{{ image_size_variation.url }}");
            }
          }
        {% else %}
          {% assign previous_image_variation = forloop.index | minus: 2 %}

          @media screen and (min-width: {{ image_sizes_reversed[previous_image_variation].width | plus: 1 }}px), screen and (min-height: {{ image_sizes_reversed[previous_image_variation].height | plus: 1 }}px) {
            [data-bg-area='section-1'] {
              background-image: url("{{ image_size_variation.url }}");
            }
          }
        {% endif %}
      {% endfor %}

      [data-bg-area='section-1'] [data-bg-picker="color-overlay"] {
        background-color: {{ bg_picker_section_1.color }};
      }
    {% else %}
      @media screen and (max-width: 600px), screen and (max-height: 350px) {
        [data-bg-area='section-1'] {
          background-image: url("{{ images_path }}/house_block.jpg");
        }
      }

      @media screen and (min-width: 601px), screen and (min-height: 351px) {
        [data-bg-area='section-1'] {
          background-image: url("{{ images_path }}/house_large.jpg");
        }
      }

      @media screen and (min-width: 1281px), screen and (min-height: 748px) {
        [data-bg-area='section-1'] {
          background-image: url("{{ images_path }}/house_huge.jpg");
        }
      }

      @media screen and (min-width: 2049px), screen and (min-height: 1196px) {
        [data-bg-area='section-1'] {
          background-image: url("{{ images_path }}/house.jpg");
        }
      }
    {% endunless %}
    {% comment %}[[ SECTION 1 BACKGROUND END ]]{% endcomment %}

    {% comment %}[[ SECTION 2 BACKGROUND START ]]{% endcomment %}
    {% unless bg_picker_section_2 == nil %}
      {% assign image_sizes_reversed = bg_picker_section_2.imageSizes | reverse %}

      {% for image_size_variation in image_sizes_reversed %}
        {% if forloop.first %}
          @media screen and (max-width: {{ image_size_variation.width }}px), screen and (max-height: {{ image_size_variation.height }}px) {
            [data-bg-area='section-2'] {
              background-image: url("{{ image_size_variation.url }}");
            }
          }
        {% else %}
          {% assign previous_image_variation = forloop.index | minus: 2 %}

          @media screen and (min-width: {{ image_sizes_reversed[previous_image_variation].width | plus: 1 }}px), screen and (min-height: {{ image_sizes_reversed[previous_image_variation].height | plus: 1 }}px) {
            [data-bg-area='section-2'] {
              background-image: url("{{ image_size_variation.url }}");
            }
          }
        {% endif %}
      {% endfor %}

      [data-bg-area='section-2'] [data-bg-picker="color-overlay"] {
        background-color: {{ bg_picker_section_2.color }};
      }
    {% comment %}{% else %}{% endcomment %}
    {% comment %}Add default styles here if any.{% endcomment %}
    {% endunless %}
    {% comment %}[[ SECTION 2 BACKGROUND END ]]{% endcomment %}

    {% comment %}[[ SECTION 3 BACKGROUND START ]]{% endcomment %}
    {% unless bg_picker_section_3 == nil %}
      {% assign image_sizes_reversed = bg_picker_section_3.imageSizes | reverse %}

      {% for image_size_variation in image_sizes_reversed %}
        {% if forloop.first %}
          @media screen and (max-width: {{ image_size_variation.width }}px), screen and (max-height: {{ image_size_variation.height }}px) {
            [data-bg-area='section-3'] {
              background-image: url("{{ image_size_variation.url }}");
            }
          }
        {% else %}
          {% assign previous_image_variation = forloop.index | minus: 2 %}

          @media screen and (min-width: {{ image_sizes_reversed[previous_image_variation].width | plus: 1 }}px), screen and (min-height: {{ image_sizes_reversed[previous_image_variation].height | plus: 1 }}px) {
            [data-bg-area='section-3'] {
              background-image: url("{{ image_size_variation.url }}");
            }
          }
        {% endif %}
      {% endfor %}

      [data-bg-area='section-3'] [data-bg-picker="color-overlay"] {
        background-color: {{ bg_picker_section_3.color }};
      }
    {% else %}
      @media screen and (max-width: 600px), screen and (max-height: 351px) {
        [data-bg-area='section-3'] {
          background-image: url("{{ images_path }}/boats_block.jpg");
        }
      }

      @media screen and (min-width: 601px), screen and (min-height: 352px) {
        [data-bg-area='section-3'] {
          background-image: url("{{ images_path }}/boats_large.jpg");
        }
      }

      @media screen and (min-width: 1281px), screen and (min-height: 749px) {
        [data-bg-area='section-3'] {
          background-image: url("{{ images_path }}/boats_huge.jpg");
        }
      }

      @media screen and (min-width: 2049px), screen and (min-height: 1197px) {
        [data-bg-area='section-3'] {
          background-image: url("{{ images_path }}/boat.jpg");
        }
      }

      [data-bg-area='section-3'] [data-bg-picker="color-overlay"] {
        background-color: rgba(39,62,98,0.4);
      }
    {% endunless %}
    {% comment %}[[ SECTION 3 BACKGROUND END ]]{% endcomment %}

    {% comment %}[[ SECTION 4 BACKGROUND START ]]{% endcomment %}
    {% unless bg_picker_section_4 == nil %}
      {% assign image_sizes_reversed = bg_picker_section_4.imageSizes | reverse %}
      {% assign image_sizes_reversed_size = image_sizes_reversed | size %}


      {% if image_sizes_reversed_size > 1  %}
        {% for image_size_variation in image_sizes_reversed %}
          {% if forloop.first %}
            @media screen and (max-width: {{ image_size_variation.width }}px), screen and (max-height: {{ image_size_variation.height }}px) {
              [data-bg-area='section-4'] {
                background-image: url("{{ image_size_variation.url }}");
              }
            }
          {% else %}
            {% assign previous_image_variation = forloop.index | minus: 2 %}

            @media screen and (min-width: {{ image_sizes_reversed[previous_image_variation].width | plus: 1 }}px), screen and (min-height: {{ image_sizes_reversed[previous_image_variation].height | plus: 1 }}px) {
              [data-bg-area='section-4'] {
                background-image: url("{{ image_size_variation.url }}");
              }
            }
          {% endif %}
        {% endfor %}
      {% else %}
        [data-bg-area='section-4'] {
          background-image: url("{{ bg_picker_section_4.image }}");
        }
      {% endif %}

      [data-bg-area='section-4'] [data-bg-picker="color-overlay"] {
        background-color: {{ bg_picker_section_4.color }};
      }
    {% comment %}{% else %}{% endcomment %}
    {% comment %}Add default styles here if any.{% endcomment %}
    {% endunless %}
    {% comment %}[[ SECTION 4 BACKGROUND END ]]{% endcomment %}
  </style>
{% endcapture %}

{% comment %}TODO: Minify when done developing.{% endcomment %}
{{ template_styles }}
