const template = document.createElement('template');
template.innerHTML = `
  <style>
    h1.title {
      color: red;
    }
  </style>

  <h1 class='title'>Hello World</h1>
  <button class='change-h1-color'>Change color to blue</button>
`;

class MyElement extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$button = this._shadowRoot.querySelector('button.change-h1-color');
    const shadowRoot = this._shadowRoot;

    this.$button.onclick = function() {
      shadowRoot.querySelector('h1').style.color = "blue";
    };
  }
}

window.customElements.define('my-element', MyElement);
