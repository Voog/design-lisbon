<!DOCTYPE html>
{% include "template-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state="{{ view_mode }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout">
    <main>
      <section class="layout-content layout-content--main" data-theme="normal" data-bg-picker="area">
        {% if editmode %}
          <button class="btn" data-bg-picker="button" data-bg-picker-picture-option="true" data-bg-picker-target-width="2048" data-bg-picker-color-option="true" data-bg-picker-key="bg_section_1" data-bg="{{ page.data.bg_section_1 | json | escape }}"></button>
        {% endif %}
        
        <div class="layout-content__wrap layout-content__wrap--featured">
          <div class="content-area">{% content %}</div>
        </div>
      </section>
      
      <section class="layout-content layout-content--main" data-theme="normal" data-bg-picker="area">
        {% if editmode %}
          <button data-state="hidden" data-bg-picker="button" data-bg-picker-picture-option="true" data-bg-picker-target-width="2048" data-bg-picker-color-option="true" data-bg-picker-key="bg_section_2" data-bg="{{ page.data.bg_section_2 | json | escape }}"></button>
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
