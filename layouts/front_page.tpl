<!DOCTYPE html>
{% include "template-variables" %}

<html lang="{{ page.language_code }}" data-state="{{ view_mode }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout">
    <main class="layout__container">
      <section class="layout-content layout-content--main">
        <div class="layout-content__wrap">
          <div class="content-area">{% content %}</div>
        </div>
      </section>
    </main>
  </body>
</html>
