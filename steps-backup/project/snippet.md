In the file `filename.hmtl` write this code:

```html
<dom-module id="exchange-result">
  <script>
    // Define the element's API using an ES2015 class
    class ExchangeResult extends Polymer.Element {

      calculateExchangeByRate(data) {
        var decimales = 5;
        if (data.base) {
          this.base = data.base;
        }

        var iguales = false;

        if (typeof data === 'object') {
          if (Object.keys(data.rates).length == 0) {
            iguales = true;
            this.rate = 1;
            this.divisa = this.base;
          } else {
            for (var divisa in data.rates) {
              this.rate = data.rates[divisa];
              this.divisa = divisa;
              console.log(this.divisa);
            }
          }
        } else {
          if (!isNaN(data)) {
            this.amount = data;
          } else {
            this.amount = 0;
          }
        }

        if (!isNaN(this.amount)) {
          if (iguales) {
            this.result = this.round(this.amount, decimales) + " " + this.divisa;
          } else {
            if (this.amount && this.rate) {
              this.result = this.round(this.amount * this.rate, decimales) + " " + this.divisa;
            } else {
              this.result = 0 + " " + this.divisa;
            }
          }
        } else {
          this.result('Valor no válido.');
        }

        return this.result;
      }
    }
  </script>
</dom-module>
```

```json
{
  "zone": "app__main",
  "familyPath": "../elements/forex-dm",
  "tag": "forex-dm",
  "properties": {
    "cellsConnections": {
      "in": {
        "__bridge_page_home": {
          "bind": "getCurrent"
        },
        "currency-from-channel": {
          "bind": "currencyFromSelectedMethod"
        },
        "currency-to-channel": {
          "bind": "currencyToSelectedMethod"
        }
      },
      "out": {
        "ch_request_start" : {
          "bind": "forex-request-start"
        },
        "ch_request_ok" : {
          "bind": "forex-request-ok"
        }
      }
    }
  }
}
```
