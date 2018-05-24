
As the information that the API returns does not work for us as we obtain it from the data provider, we need a component that is responsible for transforming the data. That is the role of what we call a data manager. A data manager is a component that encapsulates the details of how the data is obtained and provides methods and properties so that the information can be consumed in the way that is most appropriate for our application.

The component we need is not in the Cells Components Catalog so we're going to have to create it. The components that are unique to our application are written under the `elements` folder unlike the components installed with bower, which goes in the` components` folder.

The creation of a data manager is a topic for another code lab so here we'll briefly see what they are for and we'll create one without going into details.

The data manager will have functions that:
* recover today's comic
* retrieve the comic from the previous day
* retrieve the comic the next day
* recover a random comic

You must also notify through events:
* when a request has started
* when the request has successfully completed
* when the request has given an error
* when the last data has been reached
* when the first data has been reached
* when there is more data

Into the folder `app\elements` create a new folder `comic-dm`. Inside that folder create a file `comic-dm.hmtl`.

In the file `comic-dm.hmtl` write this code:

```html
<link rel="import" href="../../components/cells-generic-dp/cells-generic-dp.html">

<dom-module id="comic-dm">

  <template>
    <cells-generic-dp
      id="comicDP"
      host="https://any-api.com:3010"
      path="http://xkcd.com/info.0.json"
      method="GET">
    </cells-generic-dp>
  </template>

  <script>

// Define the element's API using an ES2015 class
  class ComicDM extends Polymer.Element {
    static get is() {
      return 'comic-dm';
    }
  // Declare properties for the element's public API
    static get properties() {
      return {
        number: {
          type: Number,
          notify: true
        },
        image: {
          type: String,
          notify: true
        },
        title: {
          type: String,
          notify: true
        },
        date: {
          type: Object,
          notify: true
        },
        alt: {
          type: String,
          notify: true
        },
        transcript: {
          type: String,
          notify: true
        },
        label: {
          type: String,
          notify: true,
          computed: '_computeLabel(title, date)'
        }
      };
    }

    ready() {
      super.ready();
      this.addEventListener('request-success', this._onRequestOk);
      this.addEventListener('request-error', this._onRequestError);
      this.todayNumber = undefined;
    }

    _computeLabel(title, date){
      let label = '';
      if (title && date) {
        label = `${title}. Published in ${date.day}/${date.month}/${date.year}`;
      }
      return label;
    }

    getCurrent() {
      this.$.comicDP.path = `http://xkcd.com/info.0.json`;
      this.$.comicDP.generateRequest();
      this.dispatchEvent(new CustomEvent('comic-request-start'));
    }

    getPrevious() {
      this.$.comicDP.path = `http://xkcd.com/${this.number-1}/info.0.json`;
      this.$.comicDP.generateRequest();
      this.dispatchEvent(new CustomEvent('comic-request-start'));
    }

    getRandom() {
      let randomNumber = Math.trunc(Math.random()*this.todayNumber);
      this.$.comicDP.path = `http://xkcd.com/${randomNumber}/info.0.json`;
      this.$.comicDP.generateRequest();
      this.dispatchEvent(new CustomEvent('comic-request-start'));
    }

    getNext() {
      this.$.comicDP.path = `http://xkcd.com/${this.number+1}/info.0.json`;
      this.$.comicDP.generateRequest();
      this.dispatchEvent(new CustomEvent('comic-request-start'));
    }

    _onRequestOk(evt) {
      let data = evt.detail;
      this.number = data.num;
      this.image = data.img;
      this.alt = data.alt;
      this.transcript = data.transcript;
      this.title = data.title;
      this.date = { year: data.year, month: data.month, day: data.day };
      if (!this.todayNumber) {
        this.todayNumber = data.num;
      }
      if (data.num === this.todayNumber) {
        this.dispatchEvent(new CustomEvent('comic-last-reached'));
      } else if (data.num === 1) {
          this.dispatchEvent(new CustomEvent('comic-first-reached'));
      } else {
        this.dispatchEvent(new CustomEvent('comic-more-left'));
      }

      this.dispatchEvent(new CustomEvent('comic-request-ok'), data);
    }

    _onRequestError(err) {
      this.dispatchEvent(new CustomEvent('comic-request-error'));
    }

  }
  // Register the custom element with the browser
  customElements.define(ComicDM.is, ComicDM);

  </script>

</dom-module>
```

You can delete the folder `app/elements/my-greeting` because we won't need it.