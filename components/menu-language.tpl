{% if editmode or site.has_many_languages? %}
  <ul class="menu-language">
    {% for language in site.languages %}
      <li class="menu-language__item{% if language.selected? %} menu-language__item--selected{% endif %}">
        <a class="menu-language__link" href="{{ language.url }}">{{ language.title }}</a>
      </li>
    {% endfor %}

    {% if editmode %}
      <li class="menu-language__item menu-language__item--cms-button">{% languageadd %}</li>
    {% endif %}
  </ul>
{% endif %}