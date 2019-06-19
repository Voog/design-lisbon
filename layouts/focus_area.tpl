<!DOCTYPE html>
{% include "template-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state="{{ view_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
    {% include "template-styles" %}
  </head>

  <body class="layout">
    <div class="layout-wrap">
      {% include "layout-header" %}

      <main>
        <section class="layout-content layout-content--main layout-content--with-bg" data-theme="white" data-bg-picker="area" data-bg-area="section-1">
          {% if editmode or bg_picker_section_1.color %}
            <div class="layout-content__color-overlay" data-bg-picker="color-overlay"></div>
          {% endif %}

          {% if editmode %}
            <button class="btn--center-left" data-state="hidden" data-bg-picker="button" data-bg-picker-picture-option="true" data-bg-picker-target-width="2048" data-bg-picker-color-option="true" data-bg-picker-alpha-option="true" data-bg-picker-key="bg_picker_section_1" data-bg="{{ bg_picker_section_1_data }}"></button>
          {% endif %}

          <div class="layout-content__wrap layout-content__wrap--narrow layout-content__wrap--focus-content">
            <div class="content-area">{% content %}</div>
          </div>
        </section>
      </main>

      {% include "template-javascripts" %}
      {% include "template-tools" %}
    </div>
  </body>
</html>
