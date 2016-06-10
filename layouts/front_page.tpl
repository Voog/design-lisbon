<!DOCTYPE html>
{% include "template-variables" %}

<html class="root" lang="{{ page.language_code }}" data-state="{{ view_mode }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout">
    <main>
      <section class="layout-content layout-content--main" data-theme="normal">
        <div class="layout-content__wrap layout-content__wrap--featured">
          <div class="content-area">{% content %}</div>
        </div>
      </section>
    </main>
  </body>
</html>
