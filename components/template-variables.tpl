{% capture dont_render %}
  {% comment %}Detects viewing mode.{% endcomment %}
  {% if editmode %}
    {% assign view_mode = "editmode" %}
  {% else %}
    {% assign view_mode = "publicmode" %}
  {% endif %}

  {% comment %}Background variables{% endcomment %}
  {% unless page.data.bg_picker_section_1 == nil %}
    {% assign bg_picker_section_1_data = page.data.bg_picker_section_1 | json | escape %}
  {% else %}
    {% capture bg_picker_section_1_data %}
      {
        "original_id": 1503,
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
{% endcapture %}
