<header class="layout-header" data-theme="white">
  <div class="layout-header__title">
    {% if editmode %}
      <a class="layout-header__link" href="{{ site.root_item.url }}">
        <div class="content-area">{% editable site.header %}</div>
      </a>
    {% else %}
      <div class="content-area">{{ site.header }}</div>
    {% endif %}
  </div>

  <nav class="layout-header__menu-main">
    {% include "menu-main" %}
  </nav>

  <nav class="layout-header__menu-language">
    {% include "menu-language" %}
  </nav>
</header>
