<!DOCTYPE html>
{% include "template-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state="{{ view_mode }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
    {% include "template-styles" %}
  </head>

  <body class="layout">
    {% include "layout-header" %}

    <main>
      <section class="layout-content layout-content--main layout-content--with-bg" data-theme="normal" data-bg-picker="area" data-bg-area="section-2">
        {% if editmode or bg_picker_section_2.color %}
          <div class="layout-content__color-overlay" data-bg-picker="color-overlay"></div>
        {% endif %}

        {% if editmode %}
          <button class="btn--center-left" data-state="hidden" data-bg-picker="button" data-bg-picker-picture-option="true" data-bg-picker-target-width="2048" data-bg-picker-color-option="true" data-bg-picker-alpha-option="true" data-bg-picker-key="bg_picker_section_2" data-bg="{{ page.data.bg_picker_section_2 | json | escape }}"></button>
        {% endif %}

        <div class="layout-content__wrap layout-content__wrap--normal">
          <div class="layout-content__area layout-content__area--top">
            <div class="content-area">{% content name="section_2_title" %}</div>
          </div>

          <div class="layout-content__area layout-content__area--features-wrap">
            <div class="layout-content__col layout-content__col--features-body">
              <div class="content-area">{% content name="section_2_body" %}</div>
            </div>

            <div class="layout-content__col layout-content__col--features-list">
              <div class="feature">
                <img class="feature__illustration" src="/photos/room-with-2-beds.jpg">
                <div class="feature__body">
                  <div class="content-area">{% content name="feature_1" %}</div>
                </div>
              </div>

              <div class="feature">
                <img class="feature__illustration" src="/photos/room-with-3-beds.jpg">
                <div class="feature__body">
                  <div class="content-area">{% content name="feature_2" %}</div>
                </div>
              </div>

              <div class="feature">
                <img class="feature__illustration" src="/photos/room-with-4-beds.jpg">
                <div class="feature__body">
                  <div class="content-area">{% content name="feature_3" %}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>

    {% include "template-javascripts" %}
    {% include "template-tools" %}
  </body>
</html>
