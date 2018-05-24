(function() {

  'use strict';

  Polymer({

    is: 'cells-radio-tabs',

    properties: {
      /**
       * List of options.
       * Can be an array of Strings used as labels for each tab or Objects with a "label" key and and optional "icon" key to display
       * an icon to the left of the text.
       */
      options: {
        type: Array,
        observer: '_setOptions'
      },

      /**
       * Size for the icons.
       */
      iconSize: {
        type: Number,
        value: 24
      },

      /**
       * Index of the selected option.
       */
      selected: {
        type: Number,
        value: 0,
        notify: true
      },

      _uniqueID: {
        type: Number,
        value: function() {
          return new Date().valueOf();
        }
      },

      _hasLabels: {
        type: Boolean,
        computed: '_computeHasLabels(options)'
      }
    },

    observers: [
      '_selectedChanged(selected, options, isAttached)'
    ],

    /**
     * Fired after updating the styles when the component is rendered.
     * @event cells-radio-tabs-styles-updated
     * @param {{itemWidth: String}} detail width applied to each tab
     */
    _setOptions: function(options) {
      this.updateStyles({'--radio-tabs-item-width': 100 / options.length + '%'});
      this.dispatchEvent(new CustomEvent('cells-radio-tabs-styles-updated', {
        bubbles: true,
        composed: true,
        detail: {
          itemWidth: 100 / options.length + '%'
        }
      }));
    },

    /**
     * Selects the item on click event and on keydown only if the key pressed is space (32) or enter (13).
     * Prevents selecting an item while navigating through tabs using the tab key.
     */
    _setSelected: function(e) {
      if (e.type === 'keydown' && [32, 13].indexOf(e.keyCode) === -1) {
        return;
      }
      this.selected = e.model.index;
    },

    _computeChecked: function(selected, index) {
      return Number(selected) === index;
    },

    _selectedChanged: function(selected, options, isAttached) {
      if (!isAttached) {
        return;
      }

      if (Number(selected) > (options || []).length - 1 || Number(selected) < 0) {
        return;
      }

      this.$.indicator.style.transform = `translateX(calc(100% * ${selected}))`;
    },

    _computeHasLabels: function(options) {
      return options.some(option => option.label);
    }
  });

}());
