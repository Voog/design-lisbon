<!DOCTYPE html>
{% include "template-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state="{{ view_mode }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
    {% include "template-styles" %}
  </head>

  <body class="layout">

    <h1>{{ bg_picker_section_1_json }}</h1>

    <main>
      <section class="layout-content layout-content--main layout-content--with-bg" data-theme="white" data-bg-picker="area" data-bg-area-index="1">
        <div class="layout-content__color-overlay" data-bg-picker="color-overlay"></div>

        {% if editmode %}
          <button class="btn--center-left" data-state="hidden" data-bg-picker="button" data-bg-picker-picture-option="true" data-bg-picker-target-width="2048" data-bg-picker-color-option="true" data-bg-picker-alpha-option="true" data-bg-picker-key="bg_picker_section_1" data-bg="{{ bg_picker_section_1_json }}"></button>
        {% endif %}

        <div class="layout-content__wrap layout-content__wrap--featured">
          <div class="content-area">{% content %}</div>
        </div>
      </section>

      <section class="layout-content layout-content--main layout-content--with-bg" data-theme="normal" data-bg-picker="area" data-bg-area-index="2">
        <div class="layout-content__color-overlay" data-bg-picker="color-overlay"></div>

        {% if editmode %}
          <button class="btn--center-left" data-state="hidden" data-bg-picker="button" data-bg-picker-picture-option="true" data-bg-picker-target-width="2048" data-bg-picker-color-option="true" data-bg-picker-alpha-option="true" data-bg-picker-key="bg_picker_section_2" data-bg="{{ page.data.bg_picker_section_2 | json | escape }}"></button>
        {% endif %}

        <div class="layout-content__wrap layout-content__wrap--featured">
          <div class="content-area">{% content %}</div>
        </div>
      </section>
    </main>

    {% include "template-javascripts" %}
    {% include "template-tools" %}
  </body>
</html>
