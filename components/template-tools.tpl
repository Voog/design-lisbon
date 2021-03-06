{% comment %}[[ TEMPLATE TOOLS RELATED JAVASCRIPT ]]{% endcomment %}
{% comment %}Adds template specific JS tools.{% endcomment %}
{% editorjsblock %}
  <script src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"></script>

  <script>
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    //==========================================================================
    // Binds custom styles under wysihtml editor.
    //==========================================================================
    template.bindCustomTextEditorStyles('{{ "button" | lc: editor_locale }}');

    template.bindBgPickers();
  </script>
{% endeditorjsblock %}
