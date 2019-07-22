const button = document.body.getElementsByClassName("change-h1-color")[0];

button.onclick = function() {
  document.body.getElementsByTagName("h1")[0].style.color = "blue";
};
