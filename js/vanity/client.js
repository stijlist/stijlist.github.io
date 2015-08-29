;(function () {
  window.Vanity = function (vanityURL) {
    return { 
      incrementKey: function (key) {
        var request = new XMLHttpRequest();
        request.open('GET', vanityURL + "?key=" + key, true);

        request.onload = function() {
          if (request.status >= 200 && request.status < 400) {
            console.log(request.responseText);
          } else {
            console.log("Goofed somehow.");
          }
        };

        request.onerror = function() {
          console.log("Hit `onerror`");
        };

        request.send();
      }
    }
  };
})();
