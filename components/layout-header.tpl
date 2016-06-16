<header class="layout-header" data-theme="normal">
  <div class="layout-header__title">
    {% if editmode %}
      <div class="content-area">{% editable site.header %}</div>
    {% else %}
      <a class="layout-header__link" href="{{ site.root_item.url }}">
        <div class="content-area">{{ site.header }}</div>
      </a>
    {% endif %}
  </div>

  <nav class="layout-header__menu-main">
    {% include "menu-main" %}
  </nav>

  <nav class="layout-header__menu-language">
    {% include "menu-language" %}
  </nav>
</header>
