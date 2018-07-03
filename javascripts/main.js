;(function($) {
  // show mobile menu on scrolling up
  var lastScrollTop = 0;
  $(window).scroll(function() {
    var st = $(this).scrollTop();
    if (st > lastScrollTop) {
      setTimeout(function(){
        $('.menu-btn').removeClass('scroll');
        $('.layout-header').removeClass('scroll');
      }, 400);
    } else {
      $('.menu-btn').addClass('scroll');
      $('.layout-header').addClass('scroll');

    }
    lastScrollTop = st;
  });

  // =============================================================================
  // Vanilla JS extend function.
  //
  // Pass in the objects to merge as arguments.
  // For a deep extend, set the first argument to `true`.
  // =============================================================================
  var extend = function () {
    // Variables
    var extended = {};
    var deep = false;
    var i = 0;
    var length = arguments.length;

    // Check if a deep merge
    if (Object.prototype.toString.call(arguments[0]) === '[object Boolean]') {
      deep = arguments[0];
      i++;
    }

    // Merge the object into the extended object
    var merge = function (obj) {
      for (var prop in obj) {
        if (Object.prototype.hasOwnProperty.call(obj, prop)) {
          // If deep merge and property is an object, merge properties
          if (deep && Object.prototype.toString.call(obj[prop]) === '[object Object]') {
            extended[prop] = extend(true, extended[prop], obj[prop]);
          } else {
            extended[prop] = obj[prop];
          }
        }
      }
    };

    // Loop through each object and conduct a merge
    for (; i < length; i++) {
      var obj = arguments[i];
      merge(obj);
    }

    return extended;
  };

  // ===========================================================================
  // Positions popover menus under the toggleing button.
  // ===========================================================================
  var bindInterfaceButtons = function() {
    // Triggers the events when clicked anywhere on the document. Used for
    // sideclick functionality. Use the data-sideclick="prevent" on elements
    // that shouldn't trigger the sideclick events.
    $(document).on('click touchstart', function(event) {
      // Also supports fallback for disabling sideclick with "js-prevent-sideclick" class (SettingsEditor relies on it).
      if (!$(event.target).closest('[data-sideclick="prevent"]').length && !$(event.target).closest('.js-prevent-sideclick').length) {
        var $html = $('html');

        $html.removeClass('menu-language-popover-open');
        $html.attr('data-menu-main-state', 'closed');
        $html.removeClass('site-search-opened');

        $('.js-search-input').val('');
      }
    });

    // Toggles main menu in mobile view.
  	$('[data-behavior="toggle-menu-main"]').click(function() {
      var $html = $('html');

      if ($html.attr('data-menu-main-state') == 'open') {
        $html.attr('data-menu-main-state', 'closed');
      } else {
        $html.attr('data-menu-main-state', 'open');
        $html.removeClass('menu-language-popover-open site-search-opened');
      }
  	});

    // Toggles blog article comments author fields.
    $('[data-behavior="toggle-comment-form-fields"]')
      .on('focus', function() {
        $('#comment-form__details').attr('data-display-state', 'block');
      })
      .on('blur', function() {
        if ($('#comment-form__body').val().length === 0 && $('#comment-form__name').val().length === 0 && $('#comment-form__email').val().length === 0) {
          setTimeout(function() {
            if (!$(document.activeElement).is('[data-group="comment-field"]')) {
              $('#comment-form__details').attr('data-display-state', 'none');
            }
          }, 0);
        }
      })
    ;

    // Toggles language menu popover.
    $('.js-toggle-menu-language').click(function() {
      var $html = $('html');

      $html.toggleClass('menu-language-popover-open');

      if ($html.hasClass('menu-main-opened') || $html.hasClass('site-search-opened')) {
        $html.removeClass('menu-main-opened site-search-opened');

        setTimeout(function(){
          positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
        }, 300);
      } else if ($html.hasClass('menu-language-popover-open')) {
        positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
      }
    });

    // Toggles site search.
    $('.js-toggle-site-search').click(function() {
      var $html = $('html');

      $html.removeClass('menu-language-popover-open');
      $html.attr('data-menu-main-state', 'closed');
      $html.toggleClass('site-search-opened');

      if ($html.hasClass('site-search-opened')) {
        $('.js-search-input').focus();
      }
    });

    // Clears site search input.
    $('.js-clear-search-input').click(function() {
      var $searchInput = $('.js-search-input');

      if ($searchInput.val().length > 0) {
        $searchInput.val('').focus();
      } else {
        $('html').removeClass('site-search-opened');
      }
    });
  };

  // ===========================================================================
  // Positions popover menus under the toggleing button.
  // ===========================================================================
  var positionPopoverMenu = function(popoverButton, popoverMenu) {
    var $popoverButton = $(popoverButton);

    $(popoverMenu).css({
      top: Math.round($popoverButton.offset().top + $popoverButton.outerHeight()),
      right: Math.round($(window).width() - $popoverButton.offset().left - $popoverButton.outerWidth())
    });
  };

  var bindCustomTextEditorStyles = function(buttonTranslation) {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  };

  // =============================================================================
  // Binds editmode background pickers.
  // =============================================================================
  var bindBgPickers = function() {
    document.querySelectorAll('[data-bg-picker="area"]').forEach(function(bgPickerArea) {
      var bgPickerButton = bgPickerArea.querySelector('[data-bg-picker="button"]');

      bgPickerButton.setAttribute('data-state', 'visible-block');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
        picture: bgPickerButton.getAttribute('data-bg-picker-picture-option'),
        target_width: bgPickerButton.getAttribute('data-bg-picker-target-width'),
        color: bgPickerButton.getAttribute('data-bg-picker-color-option'),
        showAlpha: bgPickerButton.getAttribute('data-bg-picker-alpha-option'),

        preview: function(data) {
          if (data.image) {
            bgPickerArea.style.backgroundImage = "url('" + data.image + "')";
          } else {
            bgPickerArea.style.backgroundImage = 'none';
          }

          if (data.color) {
            bgPickerArea.querySelector('[data-bg-picker="color-overlay"]').style.backgroundColor = data.color;
          } else {
            bgPickerArea.querySelector('[data-bg-picker="color-overlay"]').style.backgroundColor = 'transparent';
          }
        },

        commit: function(data) {
          pageData.set(bgPickerButton.getAttribute('data-bg-picker-key'), data);
        }
      });
    });
  };

  // =============================================================================
  // Sets functions that will be initiated globally.
  // =============================================================================
  var init = function() {
    bindInterfaceButtons();
  };

  // Enables the usage of the initiations outside this file.
  window.template = extend(window.template || {}, {
    // Initiations for layouts.
    // initBlogPage: initBlogPage,
    // initArticlePage: initArticlePage,
    // initCommonPage: initCommonPage,
    // initFrontPage: initFrontPage,

    // Initiations for specific functions.
    bindCustomTextEditorStyles: bindCustomTextEditorStyles,
    bindBgPickers: bindBgPickers,
  });

  // =============================================================================
  // Initiates global functions.
  // =============================================================================
  init();
})(jQuery);