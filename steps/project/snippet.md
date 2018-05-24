In the file `filename.hmtl` write this code:

```html
<dom-module id="foreign-exchange">
  <template is="dom-bind">
    <style include="cells-grid-template-styles"></style>
    <style>
      :host {
        display: block;
        padding: 1em 0;
        margin: auto auto 4rem;
      }

      cells-select {
        background-color: #DDDDDD;
        margin-bottom: 2em;

        --cells-select-icon: {
          margin-right: 8px;
        };

        --cells-select-item-title: {
          max-width: 90px;
        };

        --cells-select-item-description: {
          font-size: 12px;
        };
      }

      #currencyFrom {
        z-index: 3;
      }
    </style>

    <div id="select-exchange" class="cgt">
      <div class="cgt-col-xs-8 cgt-col-sm-4 cgt-col-md-6 cgt-col-lg-6">
        <cells-select
          id="currencyFrom"
          options="[[optionsFrom]]"
          label="Origin currency"
          right-icon="coronita:unfold"
          placeholder="Select a currency">
        </cells-select>
      </div>
      <div class="cgt-col-xs-8 cgt-col-sm-4 cgt-col-md-6 cgt-col-lg-6">
        <cells-select
          id="currencyTo"
          options="[[optionsTo]]"
          label="Destination currency"
          right-icon="coronita:unfold"
          placeholder="Select a currency">
        </cells-select>
      </div>
    </div>
  </template>
</dom-module>
```

```json
{
  "zone": "app__main",
  "type": "UI",
  "familyPath": "../elements/exchange-result",
  "tag": "exchange-result",
  "properties": {
    "cellsConnections": {
      "in": {
        "my-amount-channel": {
          "bind": "calculateExchangeByRate"
        },
        "ch_request_ok" : {
          "bind": "calculateExchangeByRate"
        }
      }
    }
  }
}
```
