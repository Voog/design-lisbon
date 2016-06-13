<header class="layout-header">
  <div class="layout-header__title">
    {% if editmode %}
      <a href="{{ site.root_item.url }}">
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