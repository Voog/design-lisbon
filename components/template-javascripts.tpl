{% comment %} ==================================================================
TEMPLATE'S JAVASCRIPTS
=============================================================== {% endcomment %}
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js"></script>
{% comment %}Main template functionality.{% endcomment %}
{% comment %}TODO: Use minified verion when going to live.{% endcomment %}
<script src="{{ javascripts_path }}/main.js"></script>

{% comment %}Google analytics initiation.{% endcomment %}
{{ site.analytics }}
