const button = document.body.getElementsByClassName("change-h1-color")[0];

function changeColor(color: string) {
  return color;
}

button.addEventListener("click", function() {
  document.body.getElementsByTagName("h1")[0].style.color = changeColor("blue");
});
