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
        bgPickerArea.style.backgroundImage = "url('" + data.image + "')";
        bgPickerArea.querySelector('[data-bg-picker="color-overlay"]').style.backgroundColor = data.color;
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
};

// Enables the usage of the initiations outside this file.
window.template = extend(window.template || {}, {
  // Initiations for layouts.
  // initBlogPage: initBlogPage,
  // initArticlePage: initArticlePage,
  // initCommonPage: initCommonPage,
  // initFrontPage: initFrontPage,

  // Initiations for specific functions.
  bindBgPickers: bindBgPickers
});

// =============================================================================
// Initiates global functions.
// =============================================================================
init();
