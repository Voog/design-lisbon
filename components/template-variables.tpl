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
        "image": "/images/section-main-bg_huge.jpg",
        "width": 2048,
        "height": 1195,
        "imageSizes": [
          {
            "url": "/images/section-main-bg.jpg",
            "height": 1400,
            "width": 2400
          },
          {
            "url": "/images/section-main-bg_huge.jpg",
            "height": 1195,
            "width": 2048
          },
          {
            "url": "/images/section-main-bg_large.jpg",
            "height": 747,
            "width": 1280
          },
          {
            "url": "/images/section-main-bg_block.jpg",
            "height":350,
            "width":600
          }
        ],
        "colorData": null
      }
    {% endcapture %}
    {% assign bg_picker_section_1_data = bg_picker_section_1_data | replace: " ", "" | strip_newlines | escape %}
  {% endunless %}
  {% comment %}[[ SECTION 1 BACKGROUND END ]]{% endcomment %}

  {% comment %}[[ SECTION 1 BACKGROUND START ]]{% endcomment %}
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
  {% comment %}[[ SECTION 1 BACKGROUND END ]]{% endcomment %}
{% endcapture %}
