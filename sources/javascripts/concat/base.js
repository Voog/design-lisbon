// ===========================================================================
// Binds editmode background pickers.
// ===========================================================================
var bindBgPickers = function() {
  document.querySelectorAll('[data-bg-picker="area"]').forEach(function(bgPickerArea) {
    var bgPickerButton = bgPickerArea.querySelector('[data-bg-picker="button"]');

    bgPickerButton.setAttribute('data-state', 'visible-block');

    var bgPicker = new Edicy.BgPicker(bgPickerButton, {
      picture: bgPickerButton.getAttribute('data-bg-picker-picture-option'),
      target_width: bgPickerButton.getAttribute('data-bg-picker-target-width'),
      color: bgPickerButton.getAttribute('data-bg-picker-color-option'),

      preview: function(data) {

      },

      commit: function(data) {
        pageData.set(bgPickerButton.getAttribute('data-bg-picker-key'), data);
      }
    });
  });
};

// ===========================================================================
// Sets functions that will be initiated globally.
// ===========================================================================
var init = function() {
};

// Enables the usage of the initiations outside this file.
window.template = $.extend(window.template || {}, {
  // Initiations for layouts.
  // initBlogPage: initBlogPage,
  // initArticlePage: initArticlePage,
  // initCommonPage: initCommonPage,
  // initFrontPage: initFrontPage,

  // Initiations for specific functions.
  bindBgPickers: bindBgPickers
});

// ===========================================================================
// Initiates global functions.
// ===========================================================================
init();
