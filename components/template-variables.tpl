{% capture dont_render %}
  {% comment %}Detects viewing mode.{% endcomment %}
  {% if editmode %}
    {% assign view_mode = "editmode" %}
  {% else %}
    {% assign view_mode = "publicmode" %}
  {% endif %}

  {% comment %}[[ SECTION 1 BACKGROUND START ]]{% endcomment %}
  {% unless page.data.bg_picker_section_1 == nil %}
    {% assign bg_picker_section_1 = page.data.bg_picker_section_1 %}
    {% assign bg_picker_section_1_data = bg_picker_section_1 | json | escape %}
  {% else %}
    {% capture bg_picker_section_1_data %}
      {
        "original_id": null,
        "color": false,
        "image": "{{ images_path }}/house_huge.jpg",
        "width": 2048,
        "height": 1195,
        "imageSizes": [
          {
            "url": "{{ images_path }}/house.jpg",
            "height": 1400,
            "width": 2400
          },
          {
            "url": "{{ images_path }}/house_huge.jpg",
            "height": 1195,
            "width": 2048
          },
          {
            "url": "{{ images_path }}/house_large.jpg",
            "height": 747,
            "width": 1280
          },
          {
            "url": "{{ images_path }}/house_block.jpg",
            "height": 350,
            "width": 600
          }
        ],
        "colorData": null
      }
    {% endcapture %}
    {% assign bg_picker_section_1_data = bg_picker_section_1_data | replace: " ", "" | strip_newlines | escape %}
  {% endunless %}
  {% comment %}[[ SECTION 1 BACKGROUND END ]]{% endcomment %}

  {% comment %}[[ SECTION 2 BACKGROUND START ]]{% endcomment %}
  {% unless page.data.bg_picker_section_2 == nil %}
    {% assign bg_picker_section_2 = page.data.bg_picker_section_2 %}
    {% assign bg_picker_section_2_data = bg_picker_section_2 | json | escape %}
  {% else %}
    {% capture bg_picker_section_2_data %}
      {
        "original_id"=>nil,
        "color"=>false,
        "image"=>nil,
        "width"=>nil,
        "height"=>nil,
        "imageSizes"=>nil,
        "colorData"=>nil
      }
    {% endcapture %}
    {% assign bg_picker_section_2_data = bg_picker_section_2_data | replace: " ", "" | strip_newlines | escape %}
  {% endunless %}
  {% comment %}[[ SECTION 2 BACKGROUND END ]]{% endcomment %}

  {% comment %}[[ SECTION 3 BACKGROUND START ]]{% endcomment %}
  {% unless page.data.bg_picker_section_3 == nil %}
    {% assign bg_picker_section_3 = page.data.bg_picker_section_3 %}
    {% assign bg_picker_section_3_data = bg_picker_section_3 | json | escape %}
  {% else %}
    {% capture bg_picker_section_3_data %}
    {
      "original_id": null,
      "color": "rgba(39,62,98,0.4)",
      "image": "{{ images_path }}/boats_huge.jpg",
      "width": 2048,
      "height": 1196,
      "imageSizes": [
        {
          "url": "{{ images_path }}/boats.jpg",
          "height": 1400,
          "width": 2398
        },
        {
          "url": "{{ images_path }}/boats_huge.jpg",
          "height": 1196,
          "width": 2048
        },
        {
          "url": "{{ images_path }}/boats_large.jpg",
          "height": 748,
          "width": 1280
        },
        {
          "url": "{{ images_path }}/boats_block.jpg",
          "height": 351,
          "width": 600
        }
      ],
      "colorData": {
        "r": 39,
        "g": 62,
        "b": 98,
        "a": 0.4,
        "lightness": 0.23
      }
    }
    {% endcapture %}
    {% assign bg_picker_section_3_data = bg_picker_section_3_data | replace: " ", "" | strip_newlines | escape %}
  {% endunless %}
  {% comment %}[[ SECTION 3 BACKGROUND END ]]{% endcomment %}
{% endcapture %}
